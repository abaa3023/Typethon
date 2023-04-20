import pytest

import os

from test_compiler import Pyyctest, Result, default_pyyctests

### Code

def find_pyyctests(acc, root):
    # type: (List[str], str) -> None
    def loop(root):
        # type: (str) -> List[str]
        if os.path.isfile(root):
            if Pyyctest.base_of_testname(root) != None:
                acc.append(root)
        elif os.path.isdir(root):
            for sub in os.listdir(root):
                loop(os.path.join(root, sub))
    loop(root)

@pytest.fixture
def filename_py(request):
    runtime_result = Pyyctest.build_runtime()
    if runtime_result == Result.failure:
        print('Failed to build the run-time system.')
        return None
    compiler_result = Pyyctest.build_compiler()
    if compiler_result == Result.failure:
        print('Failed to build your compiler.')
        return None
    return request.param

def pytest_addoption(parser):
    parser.addoption('--pyyctests',
                     help='add pyyc test file name or root directory (default if none specified: {})'.format(default_pyyctests),
                     action='append')

def pytest_generate_tests(metafunc):
    if 'filename_py' in metafunc.fixturenames:
        pyyctests = metafunc.config.getoption('pyyctests')
        if pyyctests is None:
            pyyctests = default_pyyctests
        def normalize_path(path):
            path = path if os.path.isabs(path) else os.path.abspath(path)
            path = os.path.realpath(path)
            if not os.path.exists(path):
                raise ValueError('Test path {} does not exist.'.format(path))
            return path
        pyyctests = [normalize_path(p) for p in pyyctests]
        acc = []
        for root in pyyctests:
            find_pyyctests(acc, root)
        metafunc.parametrize('filename_py', acc, indirect=True)
