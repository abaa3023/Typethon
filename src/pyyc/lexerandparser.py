#!/usr/bin/env python3.10

import ply.lex as lex
import ply.yacc as yacc
import ast
from ast import *

# Lexer using ply.lex
reserved = {    # dictionary defines keywords and associated token types
    'print': 'PRINT',
    'eval': 'EVAL',
    'input': 'INPUT',
    'int' : 'INT_FUNC',
    'and' : 'AND',
    'not' : 'NOT',
    'while' : 'WHILE',
    'if' : 'IF',
    'else' : 'ELSE'
 }

#TODO - Need INDENT AND DEDENT
#tokens = ['INT','PLUS','MINUS','LPAR','RPAR', 'EQUALS', 'ID', 'COLON', 'IF', 'ELSE', 'WHILE', 'INT_WORD', 'NOT', 'AND', 'OR', 'EQUAL_EQUAL', 'NOT_EQUAL', 'INDENT', 'DEDENT'] + list(reserved.values()) #include reserved token types with other tokens

tokens = ['INT','PLUS','MINUS','LPAR','RPAR', 'EQUALS', 'ID', 'EQUAL_EQUAL','NOT_EQUAL', 'COLON', 'INDENT'] + list(reserved.values()) #include reserved token types with other tokens

#p0
t_PRINT = r'print'
t_EVAL = r'eval'
t_INPUT = r'input'
t_PLUS = r'\+'
t_LPAR = r'\('
t_RPAR = r'\)'
t_MINUS = r'\-'
t_EQUALS = r'\='
#t_ignore = ' '

#p0a
t_EQUAL_EQUAL = r'\=='
t_NOT_EQUAL = r'\!='
t_INT_FUNC=r'int'
t_AND = r'and'
t_NOT = r'not'
t_WHILE = r'while'
t_COLON = r'\:'
t_IF = r'if'
t_ELSE = r'else'
#t_INDENT = r'\t'

#TODO
#t_COLON = r'\:'
# t_IF = r'\if'
# t_ELSE = r'\else'
# t_WHILE = r'\while'
# t_INT_WORD = r'\int'
# t_NOT = r'\not'
# t_AND = r'\and'
# t_OR = r'\or'
# t_NOT_EQUAL = r'\!='


def t_ID(t):
    r'[a-zA-Z_]+[a-zA-Z0-9_]*'
    t.type = reserved.get(t.value, 'ID') # Check for resrved keywords in the ID token type. Returns 'ID' if NOT in reserved.
    return t

def t_INT(t):
    r'\d+'
    try:
        t.value = int(t.value)
    except ValueError:
        print('integer value too large', t.value)
        t.value = 0
    return t

def t_newline(t):
    r'\n+'
    t.lexer.lineno += t.value.count('\n')
    
def t_comment(t):
    r'\#.*'
    pass

# Define the INDENT token rule
def t_INDENT(t):
    r'\n[ \t]*'
    # Get the whitespace at the beginning of the line
    whitespace = t.value[len('\n'):]
    
    # If the whitespace is longer than the previous whitespace,
    # return an INDENT token with the length of the new whitespace
    if len(whitespace) > lexer.last_whitespace:
        t.value = len(whitespace)
        lexer.last_whitespace = len(whitespace)
        return t
    
# Define a rule to ignore whitespace
t_ignore = ' \t'

def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)
    

    
lex.lex()

# Parser using ply.yacc
precedence = (
('nonassoc','PRINT'),
('left', 'PLUS', 'MINUS'),
)
    
#Define the grammar rules
def p_module(t):
    'module : statements'
    t[0] = Module(body=t[1],type_ignores=[])
    
#Statement Grammar Rules ------------------------------------------
def p_statements(t):
    '''statements : statement 
                    | statement statements'''
    #If there is ONE statement (t[0] + t[1]) where t[0] is the BODY of Module
    if len(t) == 2:
        #If that ONE statement is NOT None (This happens in a 0byte file)
        if t[1] is not None:
            t[0] = [t[1]]
        else:
            #If t[1] is None, then we just want an empty list in Body
            t[0] = []
    else:
        # 'statements' can be recursively handled by this grammar rule so we put t[1] statement in body
        # and t[2] is statements so we just add that which would get handled again by this Grammar Rule.
        #This is essentially how we handle the simple_statements+ syntax seen in EBNF.
        t[0] = [t[1]] + t[2]

#This statement is to handle 0byte files.
def p_empty_statement(t):
    'statement : '
    #We do nothing, we just want to recognize this as a "statement" 
    #We want to do this so that we can build module and body.

    

#All of our expressions should converge to one expression
#Since expression + expression = expression
#We want this collection of expressions to be recognized as a single statement
def p_express_is_statement(t):
    'statement : expression'
    t[0] = t[1]
     
#p0a STUFF ---------------------------------------------
def p_int_func_expression(t):
    'expression : INT_FUNC LPAR expression RPAR'
    t[0] = Call(func=Name(id='int', ctx=Load()),args=[t[3]],keywords=[])
    
def p_compare_equals_expression(t):
    'expression : expression EQUAL_EQUAL expression'
    t[0] = Compare(left=t[1], ops=[Eq()], comparators=[t[3]], keywords=[])
    
def p_compare_notequals_expression(t):
    'expression : expression NOT_EQUAL expression'
    t[0] = Compare(left=t[1], ops=[NotEq()], comparators=[t[3]], keywords=[])    
    
def p_expression_and_expression_boolop(t):
    'expression : expression AND expression'
    t[0] = BoolOp(op=And(), values=[t[1], t[3]])  
    
def p_expression_not_expression_unop(t):
    'expression : NOT expression'
    t[0] = UnaryOp(op=Not(), operand=t[2])    
    
def p_while_expression(t):
    'expression : WHILE LPAR expression RPAR COLON suites'
    t[0] = While(test=t[3], body=t[6], orelse=[])
    
def p_if_else_expression(t):
    'expression : IF expression COLON suites ELSE COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=t[7])
    
def p_if_expression(t):
    'expression : IF expression COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=[])
    
def p_suites_is_statement(t):
    'statement : suites'
    t[0] = t[1]

# def p_suites_is_expression(t):
#     'expression : suites'
#     t[0] = t[1]
    
def p_suite_indent(t):
    'suite : INDENT expression'
    t[0] = t[2]
    
def p_suite(t):
    '''suites : suite
                | suite suites'''
    #If there is ONE statement (t[0] + t[1]) where t[0] is the BODY of Module
    if len(t) == 2:
        #If that ONE statement is NOT None (This happens in a 0byte file)
        if t[1] is not None:
            t[0] = [t[1]]
        else:
            #If t[1] is None, then we just want an empty list in Body
            t[0] = []
    else:
        # 'statements' can be recursively handled by this grammar rule so we put t[1] statement in body
        # and t[2] is statements so we just add that which would get handled again by this Grammar Rule.
        #This is essentially how we handle the simple_statements+ syntax seen in EBNF.
        t[0] = [t[1]] + t[2]
        
        
#------------------------------------------------------------------------    
    
#For print(x)


#------------ P0 FUNCTION CALLS ------------------------------
def p_print_expression(t):
    'expression : PRINT LPAR expression RPAR'
    t[0] = Expr(value=Call(func=Name(id='print', ctx=Load()),args=[t[3]],keywords=[]))
    
#This is for eval(input()) expression
#In p0, we only have eval(input()) so this is the only token we need for eval or input
def p_eval_input_expression(t):
    'expression : EVAL LPAR INPUT LPAR RPAR RPAR'
    t[0] = Call(func=Name(id='eval',ctx=Load()),args=[Call(func=Name(id='input', ctx=Load()),args=[],keywords=[])],keywords=[])

#-------------------------------------------------------------



def p_assignment_expression(t):
    'expression : assignment'
    t[0] = t[1]
    
    
#Expression and Assignment Grammar Rules
def p_assignment(t):
    'assignment : ID EQUALS expression'
    t[0] = Assign(targets=[Name(id=t[1], ctx=Store())], value=t[3])
    
def p_plus_expression(t):
    'expression : expression PLUS expression'
    t[0] = BinOp(t[1], Add(), t[3])    
      
#ID is any variable name
def p_id_expression(t):
    'expression : ID'
    t[0] = Name(id=t[1], ctx=Load())

def p_int_expression(t):
    'expression : INT'
    t[0] = Constant(t[1])
    
# For -1
def p_neg_int_expression(t):
    'expression : MINUS INT'
    t[0] = UnaryOp(op=USub(),operand=Constant(t[2]))
    
# For -x
def p_neg_id_expression(t):
    'expression : MINUS ID'
    t[0] = UnaryOp(op=USub(),operand=Name(id=t[2], ctx=Load()))    
     
def p_neg_par_expression(t):
    'expression : MINUS LPAR expression RPAR'
    t[0] = UnaryOp(op=USub(),operand=t[3])
    
def p_neg_expression(t):
    'expression : MINUS expression'
    t[0] = UnaryOp(op=USub(),operand=t[2])
    
#Arbitarily using () is acceptable in p0. So just treat it as an expression
def p_par_wrapped_expression(t):
    'expression : LPAR expression RPAR'
    t[0] = t[2]

#End Expression and Assignment Grammar Rules --------------------------------------

def p_error(t):
    print("Syntax error at '%s'" % t.value)

yacc.yacc()


#Used to parse a specific file
def createASTFromMyParser(filename):
    yacc.yacc()
    prog = ''
    with open(filename) as f:
        prog = f.read()
    tree = yacc.parse(prog) #alt parser.parse(prog)
    return tree


# Continuously parse input for testing
# while True:
#     try:
#         s = input('calc > ')
#     except EOFError:
#         break
#     if not s:
#         continue
#     tree = yacc.parse(s)
#     print(ast.dump(tree,indent=2))
#     print(tree)