#!/usr/bin/env python

import pytest

import os
import subprocess
import sys
import signal

#import enum

import argparse
import re

### Constants

this_file = os.path.realpath(__file__)
this_dir = os.path.dirname(this_file)
root_dir = os.path.realpath(os.path.join(this_dir, '..'))

python_exe = sys.executable

pyyc = os.path.join(root_dir, 'pyyc')

runtime_dir = os.path.join(root_dir, 'runtime')
runtime_lib = os.path.join(runtime_dir, 'libpyyruntime.a')

cc = ['gcc', '-m32', '-g','-lm']

default_pyyctests = [os.path.join(this_dir, 'resources')]
default_outof = 100

print_compile_log = False

popen_timeout = 5


### setup signal handler for compiler timeout

class TimeoutException(Exception):   # Custom exception class
    pass

def timeout_handler(signum, frame):   # Custom signal handler
    raise TimeoutException

# Change the behavior of SIGALRM
signal.signal(signal.SIGALRM, timeout_handler)

### Code

#Result = enum.Enum('Result', 'success warning failure')
class Result:
    success = 0
    warning = 1
    failure = 2

def popen_result(popen):
    # type: (Popen) -> Result

    signal.alarm( popen_timeout )
    try :
        (out, err) = popen.communicate()
    except TimeoutException:
        #popen.kill()
        os.killpg(os.getpgid(popen.pid), signal.SIGTERM)
        retcode = None
    else:
        signal.alarm(0)
        retcode = popen.wait()

    if retcode is None :
        print("Compilation timed out!", file=sys.stderr)
        return Result.failure
    elif retcode != 0:
        if not (out is None):
            print(out)
        if not (err is None):
            print(err, file=sys.stderr)
        return Result.failure
    elif err: # stderr is not empty or None
        return Result.warning
    else:
        return Result.success

class Pyyctest:
    def __init__(self, test_py):
        if not os.path.exists(test_py):
            raise ValueError('Test file {} does not exist'.format(test_py))
        base = self.base_of_testname(test_py)
        if base is None:
            raise ValueError('Test file must have a .py extension')
        self.base = base
        self.pysource = base + '.py'
        self.flatpysource = base + '.flatpy'
        self.starget = base + '.s'
        self.compileout = base + '.compileout'
        self.compileerr = base + '.compileerr'
        self.exe = base
        self.output = base + '.out'
        self.input = base + '.in'
        self.expected = base + '.expected'

    @staticmethod
    def base_of_testname(test_py):
        # type: (str) -> Optional[str]
        (base, ext) = os.path.splitext(test_py)
        return base if ext == '.py' else None

    @staticmethod
    def build_runtime():
        popen = subprocess.Popen(['make', '-C', runtime_dir], stdout=subprocess.PIPE,
                                 preexec_fn = lambda: os.setpgid(0, 0))
        return popen_result(popen)

    @staticmethod
    def build_compiler():
        if os.path.exists(os.path.join(root_dir, 'Makefile')):
            popen = subprocess.Popen(['make', '-C', root_dir], stdout=subprocess.PIPE,
                                 preexec_fn = lambda: os.setpgid(0, 0))
            return popen_result(popen)
        else:
            return Result.success

    def compile(self):
        # type: () -> Result
        cmd = ['bash', pyyc, self.pysource]
        if print_compile_log:
            popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                     preexec_fn = lambda: os.setpgid(0, 0))
        else:
            with open(self.compileout, 'w') as outfile:
                with open(self.compileerr, 'w') as errfile:
                    popen = subprocess.Popen(['bash', pyyc, self.pysource],
                                             stdout=outfile, stderr=errfile,
                                             preexec_fn = lambda: os.setpgid(0, 0))
        return popen_result(popen)

    def link(self):
        # type: () -> Result
        popen = subprocess.Popen(cc + [self.starget, runtime_lib, '-o', self.exe],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                 preexec_fn = lambda: os.setpgid(0, 0))
        return popen_result(popen)

    def run(self, exe, outfilename):
        # type: (, List[str], str) -> Result
        with open(outfilename, 'w') as outfile:
            if os.path.exists(self.input):
                with open(self.input, 'r') as infile:
                    popen = subprocess.Popen(exe, stdin=infile, stdout=outfile, preexec_fn = lambda: os.setpgid(0, 0))
            else:
                popen = subprocess.Popen(exe, stdout=outfile, preexec_fn = lambda: os.setpgid(0, 0))
            return popen_result(popen)

    def run_exe(self):
        # type: () -> Result
        return self.run([self.exe], self.output)

    def run_python(self, flat=False):
        # type: () -> Result
        if not flat:
            return self.run([python_exe, self.pysource], self.expected)
        else:
            if not os.path.exists(self.flatpysource):
                return Result.success
            return self.run([python_exe, self.flatpysource], self.expected)

    def diff_with_python(self):
        # type: () -> Result
        popen = subprocess.Popen(['diff', '-w', '-B', '-u', self.expected, self.output],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                 preexec_fn = lambda: os.setpgid(0, 0))
        return popen_result(popen)


def test_compiler(filename_py):
    # type: (str) -> None
    try:
        pyyctest = Pyyctest(filename_py)
        if pyyctest.run_python() == Result.failure:
            raise ValueError('Test file {} not valid'.format(filename_py))
    except ValueError as err:
        pytest.skip(err.message)
    assert pyyctest.compile() != Result.failure
    try: 
        if pyyctest.run_python(flat=True) == Result.failure:
            raise ValueError('Flattened file {} not valid'.format(filename_py))
    except ValueError as err:
        pytest.skip(err.message)
    assert pyyctest.link() != Result.failure
    assert pyyctest.run_exe() != Result.failure
    assert pyyctest.diff_with_python() != Result.failure

### Autograding Interfaces

def extract_failpass(log):
    """Extracts the failed and passed tests for the COG autograding interface.

    Todo: Extracting from the expected output string is likely brittle.
    """
    # type: (str) -> Optional[(int,int)]
    def extract(pattern):
        match = re.search(pattern, log)
        return int(match.group(1)) if not (match is None) else 0
    return (extract(r'(\d+) failed'), extract(r'(\d+) passed'))

def autograde_run(args):
    scores = []
    for pyyctests_dir in args.pyyctests:
        print("Running tests for pycctest directory '{}'".format(pyyctests_dir), file=sys.stderr)
        sys.stderr.flush()
        popen = subprocess.Popen([python_exe, '-m', 'pytest', this_file, '--pyyctests', pyyctests_dir],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        (out, err) = popen.communicate()
        print(out, file=sys.stderr)
        print(err, file=sys.stderr)
        (nfail, npass) = extract_failpass(out)
        if nfail == 0 and npass == 0:
            print('Error extracting score for {}!'.format(pyyctests_dir), file=sys.stderr)
            retcode = 3
        else:
            retcode = popen.wait()
            # pytest return codes
            # Exit code 0:	All tests were collected and passed successfully
            # Exit code 1:	Tests were collected and run but some of the tests failed
            # Exit code 2:	Test execution was interrupted by the user
            # Exit code 3:	Internal error happened while executing tests
            # Exit code 4:	pytest command line usage error
            # Exit code 5:	No tests were collected
        scores.append((pyyctests_dir, retcode, npass, nfail))
    return scores

### Cog Autograding Interface

def autograde_cog(args):
    scores = autograde_run(args)
    # For COG, return 0 even if some tests failed.
    retcode = 0
    for _,r,_,_ in scores:
        if not (r == 0 or r == 1):
            retcode = r
            break
    if retcode == 0:
        totalpass = sum([npass for _,_,npass,_ in scores])
        totalfail = sum([nfail for _,_,_,nfail in scores])
        totaltests = totalpass + totalfail
        print('{:.4f}'.format((totalpass / (totaltests * 1.0)) * args.outof))
    return retcode

### Autolab Autograding Interface

def autograde_autolab(args):
    scores = autograde_run(args)

    json_return_string = "{{ 'scores' : {scores}, 'scoreboard' : {scoreboard} }}"
    scores_dict = { os.path.basename(d.rstrip(' /')) : npass for d, _, npass, nfail in scores }
    scoreboard_list = [ npass for d, _, npass, nfail in scores ]

    print(json_return_string.format( scores = scores_dict, scoreboard = scoreboard_list ).replace("'", '"'))
    # For Autolab, return 0 even if some tests failed.
    return 0

### Main

def main(argv):
    argparser = argparse.ArgumentParser(description='Test or autograde pyyc compilers.')
    subparsers = argparser.add_subparsers()

    test_parser = subparsers.add_parser('test', help='run pytest')
    def test_cmd(_, xargs):
        return pytest.main([sys.argv[0]] + xargs)
    test_parser.set_defaults(cmd=test_cmd)

    grade_parser = subparsers.add_parser('grade', help='run with autograder interface')
    grade_parser.add_argument('--outof',
                              help='compute score out of N (default: {})'.format(default_outof),
                              metavar='N',
                              type=int,
                              default=default_outof)
    grade_parser.add_argument('--grader',
                              help='grader interface',
                              choices=['cog','autolab'],
                              required=True)
    grade_parser.add_argument('--pyyctests',
                              help='add pyyc test file name or root directory (default if none specified: {})'.format(default_pyyctests),
                              default=[],
                              action='append')
    def grade_cmd(args, _):
        # The default is the first element of the pyyctests list
        if len (args.pyyctests) == 0 :
            args.pyyctests.append(default_pyyctests)
        if args.grader == 'cog':
            return autograde_cog(args)
        elif args.grader == 'autolab':
            return autograde_autolab(args)
        else:
            raise ValueError('gremlins: unspecified args.grader')
    grade_parser.set_defaults(cmd=grade_cmd)

    (args, xargs) = argparser.parse_known_args(argv[1:])
    return args.cmd(args, xargs)

if __name__ == '__main__':
    exit(main(sys.argv))
