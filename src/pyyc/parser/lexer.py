import ply.lex as lex
import os 

reserved = {
    'print' : 'PRINT',
    'eval' : 'EVAL',
    'input' : 'INPUT'
}


 # List of token names.   This is always required
tokens = (
    'NAME',
    'INT',
    'PLUS',
    'MINUS',
    'LPAR',
    'RPAR',
    'EQ',
    'NL'
)

tokens += tuple(reserved.values())

t_PLUS    = r'\+'
t_MINUS   = r'-'
t_LPAR    = r'\('
t_RPAR    = r'\)'
t_EQ = r'='

def t_INT(t):
    r'\d+'
    t.value = int(t.value)    
    return t

def t_NAME(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    t.type = reserved.get(t.value,'NAME')
    return t
 # Define a rule so we can track line numbers
def t_NL(t):
    r'\n+'
    t.lexer.lineno += len(t.value)
    return t

def t_COMMENT(t):
    r'\#.*'
    # ignore comments.
    pass
# A string containing ignored characters (spaces and tabs)
t_ignore  = ' \t'



def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    raise Exception("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)


lexer = lex.lex()

if __name__ == "__main__":
    for i in sorted(os.listdir("examples/")):
        if ('.py' not in i):
            continue
        print(f"----- Lexxing {i} ------")
        with open(os.path.join("examples/",i)) as f:
            try:
                data = f.read()
            except SyntaxError:
                print("Inavlid P0")
                continue
        # Give the lexer some input
        lexer.input(data)

        # Tokenize
        while True:
            tok = lexer.token()
            if not tok: 
                break      # No more input
            print(tok)