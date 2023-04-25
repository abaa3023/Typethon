# import sys
# sys.path.append('.')

from parser.lexer import tokens, lexer
import ply.yacc as yacc
import ast
import os 
import difflib


precedence = (
 ('left', 'PLUS', 'MINUS'),
)



def p_program_module(p):
    'program : module'
    p[0] = ast.Module(body = p[1], type_ignores = [])

def p_module_simp_stat(p):
    '''module : simple_statement NL module
             | empty
             | NL module
             | simple_statement
    '''
    
    if (p[1] == None):
        # module : empty
        print("First statement")
        p[0] = []
    elif (p[1] == '\n'):
        p[0] = p[2]
    elif (len(p) == 2):
        first = p[1]
        if ((isinstance(p[1], ast.Expr) or isinstance(p[1], ast.Assign)) == False):
            first = ast.Expr(value = first)   
        p[0] = [first]
    else:
        # module : simple_statement NL module
        first = p[1]
        if ((isinstance(p[1], ast.Expr) or isinstance(p[1], ast.Assign)) == False):
            first = ast.Expr(value = first)            
        p[0] = [first] + p[3]

def p_empty(p):
    'empty :'
    pass

def p_simple_statement_print(p):
    'simple_statement : PRINT LPAR expression RPAR'
    p[0] = ast.Expr(
        value = ast.Call(
        func = ast.Name(id = 'print', ctx = ast.Load()),
        args = [p[3]],
        keywords = []
    ))
    
def p_simple_statement_assign(p):
    'simple_statement : NAME EQ expression'
    p[0] = ast.Assign(
        targets = [ast.Name(id = p[1], ctx = ast.Store())],
        value = p[3])


def p_simple_statement_expression(p):
    'simple_statement : expression'
    p[0] = p[1]

    
def p_expression_name(p):
    'expression : NAME'
    p[0] = ast.Name(id = p[1], ctx = ast.Load())

def p_expression_int(p):
    'expression : INT'
    print("Inside expression-> int", type(p[1]))
    p[0] = ast.Constant(value = p[1])

def p_expression_unary_sub(p):
    'expression : MINUS expression'
    p[0] = ast.UnaryOp(op = ast.USub(), operand = p[2])

def p_expression_binary_plus(p):
    'expression : expression PLUS expression'
    p[0] = ast.BinOp(left = p[1], op = ast.Add(), right = p[3])

def p_expression_para(p):
    'expression : LPAR expression RPAR'
    p[0] = p[2]

def p_expression_eval_input(p):
    'expression : EVAL LPAR INPUT LPAR RPAR RPAR'
    p[0] = ast.Call(
            func = ast.Name(id = 'eval', ctx = ast.Load()),
            args = [ast.Call(
                func = ast.Name(id = 'input', ctx = ast.Load()),
                args = [],
                keywords = [])],
            keywords = []
    )

parser = yacc.yacc()

def parse(code):
    my_ast = parser.parse(code)
    if my_ast == None:
        raise Exception("Invalid P0")
    return my_ast


if __name__ == "__main__":
    data = "print(10)"
    print(ast.dump(parse(data), indent = 1))
    
    
    for i in sorted(os.listdir("examples/")):
        if ('.py' not in i):
            continue
        print(f"----- Parsing {i} ------")
        with open(os.path.join("examples/",i)) as f:
            try:
                data = f.read()
            except SyntaxError:
                print("Inavlid P0")
                continue
        # dump the AST.
        try:
            my_ast = parse(data)
            my_ast_str = ast.dump(my_ast, indent = 1)
            py_ast_str = ast.dump(ast.parse(data), indent = 1)
            if (py_ast_str != my_ast_str):
                with open("examples/"+ i.split('.')[0] +'_my.ast', "w") as f:
                    print(my_ast_str)
                    f.write(my_ast_str)
                with open("examples/"+ i.split('.')[0] +'_py.ast', "w") as f:
                    print(py_ast_str)
                    f.write(py_ast_str)
                
                for i,s in enumerate(difflib.ndiff(py_ast_str, my_ast_str)):
                    if s[0]==' ': continue
                    elif s[0]=='-':
                        print(u'Delete "{}" from position {}'.format(s[-1],i))
                    elif s[0]=='+':
                        print(u'Add "{}" to position {}'.format(s[-1],i)) 
            else:
                print("all good")
                
        except:
            print("Invalid p0")