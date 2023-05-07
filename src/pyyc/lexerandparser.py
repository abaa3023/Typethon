#!/usr/bin/env python3.10

import ply.lex as lex
import ply.yacc as yacc
import ast
from ast import *
import re

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
    'else' : 'ELSE',
    'or' : 'OR',
    'is' : 'IS',
    'True' : 'BOOL',
    'False' : 'BOOL',
    'Int' : 'VARTYPE',
    'Bool' : 'VARTYPE',
    'List<Int>' : 'VARTYPE',
    'List<Bool>' : 'VARTYPE',
    'Dict<Int,Bool>' : 'VARTYPE',
    'Dict<Int,Int>' : 'VARTYPE',
    'Dict<Bool,Bool>' : 'VARTYPE',
    'List<List<Int>>' : 'VARTYPE',
    'List<List<Bool>>' : 'VARTYPE'
     
 }

#TODO - Need INDENT AND DEDENT
#tokens = ['INT','PLUS','MINUS','LPAR','RPAR', 'EQUALS', 'ID', 'COLON', 'IF', 'ELSE', 'WHILE', 'INT_WORD', 'NOT', 'AND', 'OR', 'EQUAL_EQUAL', 'NOT_EQUAL', 'INDENT', 'DEDENT'] + list(reserved.values()) #include reserved token types with other tokens

tokens = ['INT','PLUS','MINUS','LPAR','RPAR', 'EQUALS', 'ID', 'EQUAL_EQUAL','NOT_EQUAL', 'COLON', 'INDENT', 'BOOL','LSQUARE','RSQUARE','COMMA','LIST','LCURLY','RCURLY','DICT', 'VARTYPE'] + list(reserved.values()) #include reserved token types with other tokens

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
#t_INDENT = r'\s+'
#t_INDENT = r'\t'
#t_INDENT = r'[\t][\t ]+'

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


#p1: 
t_OR = r'or'
t_IS = r'is'
t_LSQUARE = r'\['
t_RSQUARE = r'\]'
t_BOOL = r'True|False'
t_COMMA = r'\,'
t_LCURLY = r'\{'
t_RCURLY = r'\}'

#custom
# t_VARTYPE = r'(Int|Bool|List\<LInt\>|List\<LBool\>|Dict\<DInt,DBool\>|Dict\<DInt,DInt\>|Dict\<DBool,DBool\>|List\<List\<LInt\>\>|List\<List\<LBool\>\>)'
t_VARTYPE = r'(Int|Bool|List\<Int\>|List\<Bool\>|Dict\<Int,Bool\>|Dict\<Int,Int\>|Dict\<Bool,Bool\>|List\<List\<Int\>\>|List\<List\<Bool\>\>)'

annotation_dict = {'Int' : 'int', 'Bool':'bool', 'List<Int>' : ['list','int'], 'List<Bool>' : ['list','bool'], 'List<List<Int>>' : ['list','list','int'], 'List<List<Bool>>' : ['list','list','bool'],  'Dict<Int,Bool>' : ['dict', 'int', 'bool'], 'Dict<Int,Int>' : ['dict','int','int'], 'Dict<Bool,Bool>' : ['dict','bool','bool']}


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
# def t_NEWLINE(t):
#     r'\n[\t ]*'
#     t.lexer.lineno += 1
#     t.value = t.lexer.lexdata[t.lexer.lexpos:]
#     t.value = t.value.lstrip('\n')
#     t.value = len(t.value.expandtabs(4))
#     return t
    
def t_comment(t):
    r'\#.*'
    pass

# Define the INDENT token rule
# def t_INDENT(t):
#     r'\n[ \t]*'
#     # Get the whitespace at the beginning of the line
#     whitespace = t.value[len('\n'):]
    
#     # If the whitespace is longer than the previous whitespace,
#     # return an INDENT token with the length of the new whitespace
#     if len(whitespace) > lexer.last_whitespace:
#         t.value = len(whitespace)
#         lexer.last_whitespace = len(whitespace)
#         return t
    
# Define a rule to ignore whitespace
#t_whitespace = r'[ \t]+'
t_ignore = ' \t'
t_INDENT = r'\s\s\s\s|\t'


# def t_IGNORE(t):
#     r'[ \t]+'
#     if re.match(r'^\s\s\s\s|\t', t.value):
#         t.type = 'INDENT'
#         return t
#     else:
#         t.value = ''
#         pass

# def t_INDENT(t):
#     r'^\s\s\s\s|\t'
#     return t

#t_ignore = '(?<=\S) (?=\S)'
#t_ignore = '(?<=\S)\s(?!\s*$)|(?<=^\s)\s(?!\s*$)'


# # Define a rule to handle lists
# def t_LIST(t):
#     # r'[([^]]*)]'
#     r'\[(?:\s*(?:\d+)\s*,?)*\]'
#     #t.value = t.lexer.lexmatch.group(1).split(',')
#     return t

# #Define a rule to handle dictionaries

# def t_DICT(t):
#     # r'{([^}]*)}'
#     r'\{(?:\s*(?:[^\{\}:,]+)\s*:\s*(?:[^\{\}:,]+)\s*,?)*\}'
#     # t.value = dict(item.split(':') for item in t.lexer.lexermatch.group(1).split(','))
#     return t

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
    
    
#----------------------------P1 EXPRESSIONS-----------------------------
#Grammar for IS and OR

def p_expression_compare(t):
    '''expression : expression IS expression
                  | expression OR expression'''
    # p[0] = ('COMPARE', p[2], p[1], p[3])
    op = Is()
    if t[2] == 'or':
        op = Or()
        
    t[0] = Compare(left=t[1], ops=[op], comparators=[t[3]])

#Grammar rules for lists
def p_expr_expr_list(t):
    'expression : expr_list'
    t[0] = t[1]
    
def p_expr_list(t):
    'expr_list : LSQUARE elements RSQUARE'
    t[0] = List(elts=t[2],ctx=Load())
    
def p_empty_list(t):
    'expr_list : LSQUARE RSQUARE'
    t[0] = List(elts=[], ctx=Load())
    

def p_elements(t):
    '''elements : individual_element 
        | individual_element COMMA elements'''
    new_node = None
    
    if isinstance(t[1],int):
        new_node = Constant(value=t[1], ctx=Load())
    elif isinstance(t[1],str) and t[1] == 'True' or t[1] == 'False':
        val = True
        if t[1] == 'False':
            val = False
        new_node = Constant(value=val, ctx=Load())
    elif isinstance(t[1],str):
        new_node = Name(id=t[1], ctx=Load())
    else:
        new_node = t[1]

    # try:
    #     if isinstance(t[1],List) or isinstance(t[1],Dict) or isinstance(t[1],Constant) or isinstance(t[1],Name):
    #         new_node = t[1]
    #     else:
    #         x = int(t[1])
    #         #not an ID
    #         new_node = Constant(value=t[1], ctx=Load())
    # except ValueError or TypeError:
    #     #Is an ID
    #     if t[1] == 'True' or t[1] == 'False':
    #         new_node = Constant(value=bool(t[1]), ctx=Load())
    #     elif isinstance(t[1], list) or isinstance(t[1],dict):
    #         new_node = t[1]
    #     else:
    #         new_node = Name(id=t[1], ctx=Load())
    if len(t) == 2:
        # print(type(t[1]))
        # raise Exception("wefawef")
        t[0] = [new_node]
    else:
        t[0] = [new_node] + t[3]
    
def p_individual_element(t):
    'individual_element : expression'
    t[0] = t[1]

def p_list_subscript_expression(t):
    'expression : subscript'
    t[0] = t[1]

def p_list_subscript_equals(t):
    'assignment : subscript EQUALS expression'
    t[0] = Assign(targets=[t[1]],value=t[3], ctx=Load())
    
#Grammar rules for handling dictionaries
def p_dict_expression(t):
    'expression : dict'
    t[0] = t[1]
    
def p_dictionary(t):
    ' dict : LCURLY key_value_pair RCURLY '
    dictionary = dict(t[2])
    keys = [x for x in dictionary.keys()]
    values = [y for y in dictionary.values()]
    t[0] = Dict(keys=keys, values=values)

def p_empty_dict(t):
    'dict : LCURLY RCURLY'
    t[0] = Dict(keys=[], values=[])
        
def p_key_value_pair(t):
    '''key_value_pair : dict_item
                | dict_item COMMA key_value_pair'''
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
        #print(ast.dump(t[1][1]))
        key = t[1][0]
        value = t[1][1]
        print(t[3])
        t[0] = [t[1]] + t[3]
        

def p_dict_item(t):
    'dict_item : expression COLON expression'
    t[0] = (t[1], t[3])

    
# #Grammar for handling subscriptions for lists and dictionaries

def p_subscript(t):
    'subscript : ID LSQUARE expression RSQUARE'
    t[0] = Subscript(value=Name(id=t[1],ctx=Load()), slice=t[3], ctx=Load())
    
def p_subscript2(t):
    'subscript : ID LSQUARE expression RSQUARE LSQUARE expression RSQUARE'
    t[0] = Subscript(value=Subscript(value=Name(id=t[1],ctx=Load()), slice=t[3], ctx=Load()), slice=t[6], ctx=Load())
    
def p_subscript3(t):
    'subscript : ID LSQUARE expression RSQUARE LSQUARE expression RSQUARE LSQUARE expression RSQUARE'
    t[0] = Subscript(value=Subscript(value=Subscript(value=Name(id=t[1],ctx=Load()), slice=t[3], ctx=Load()), slice=t[6], ctx=Load()), slice=t[9], ctx=Load())
    
#--------------------------------------------------------------------
     
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
    
def p_if_else_turnary_expression(t):
    'expression : expression IF expression ELSE expression'
    t[0] = IfExp(test=t[3], body=t[1], orelse=t[5])
    
def p_while_expression2(t):
    'expression : INDENT WHILE LPAR expression RPAR COLON suites'
    t[0] = While(test=t[3], body=t[6], orelse=[])
    
def p_if_else_expression2(t):
    'expression : INDENT IF expression COLON suites INDENT ELSE COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=t[7])
    
def p_if_expression2(t):
    'expression : INDENT IF expression COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=[])
    
    
def p_while_expression3(t):
    'expression : INDENT INDENT WHILE LPAR expression RPAR COLON suites'
    t[0] = While(test=t[3], body=t[6], orelse=[])
    
def p_if_else_expression3(t):
    'expression : INDENT INDENT IF expression COLON suites INDENT INDENT ELSE COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=t[7])
    
def p_if_expression3(t):
    'expression : INDENT INDENT IF expression COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=[])
    
def p_while_expression4(t):
    'expression : INDENT INDENT INDENT WHILE LPAR expression RPAR COLON suites'
    t[0] = While(test=t[3], body=t[6], orelse=[])
    
def p_if_else_expression4(t):
    'expression : INDENT INDENT INDENT IF expression COLON suites INDENT INDENT INDENT ELSE COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=t[7])
    
def p_if_expression4(t):
    'expression : INDENT INDENT INDENT IF expression COLON suites'
    t[0] = If(test=t[2], body=t[4], orelse=[])

# def p_stmts(p):
#     '''stmts : stmts stmt'''
#     t[0] = t[1] + [t[2]]

# def p_stmts_stmt(p):
#     '''stmts : expression '''
#     t[0] = [t[1]]

# def p_stmt_if(p):
#     '''expression : IF LPAREN expression RPAREN COLON expression'''
#     t[0] = If(test=t[3], body=t[6], orelse=[])

# def p_stmt_ifelse(p):
#     '''expression : IF LPAREN expression RPAREN COLON stmts ELSE COLON stmts'''
#     t[0] = If(test=t[3], body=t[6], orelse=t[10])

# def p_stmt_while(p):
#     '''expression : WHILE LPAREN expression RPAREN COLON stmts'''
#     t[0] = While(test=t[3], body=t[6], orelse=[])
    
# def p_suites_is_statement(t):
#     'statement : suites'
#     t[0] = t[1]

# def p_suites_is_expression(t):
#     'expression : suite'
#     t[0] = t[1]
    
def p_suite_indent(t):
    'suite : INDENT expression'
    t[0] = t[2]

def p_suite_indent2(t):
    'suite : INDENT INDENT expression'
    t[0] = t[2]

def p_suite_indent3(t):
    'suite : INDENT INDENT INDENT expression'
    t[0] = t[2]
    
def p_suite_indent4(t):
    'suite : INDENT INDENT INDENT INDENT expression'
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
    
    
    
#annotation_dict = {'Int' : 'int', 'Bool':'bool', 'List<Int>' : ['list','int'], 'List<Bool>' : ['list','bool'], 'List<List<Int>>' : ['list','list','int'], 'List<List<Bool>>' : ['list','list','bool'],  'Dict<Int,Bool>' : ['dict', 'int', 'bool'], 'Dict<Int,Int>' : ['dict','int','int'], 'Dict<Bool,Bool>' : ['dict','bool','bool']}   
def p_assignment(t):
    'assignment : VARTYPE ID EQUALS expression'
    
    annotation = annotation_dict[t[1]]
    annotation_ast_obj = None
    # print(annotation)
    # print(t[1])
    # raise Exception("fawefa")
 
    if isinstance(annotation,list):
        if len(annotation) == 2:
            #is list
            # print("I MADE IT HERE")
            # raise Exception("efawefa")
            annotation_ast_obj = Subscript(value=name(id=annotation[0],ctx=Load()), slice = Name(id=annotation[1],ctx=Load()))
        else:
            #is dict or list of list
            if annotation[0] == 'dict':
                annotation_ast_obj = Subscript(value=name(id=annotation[0],ctx=Load()), slice = Tuple(elts=[Name(id=annotation[1],ctx=Load()), Name(id=annotation[2],ctx=Load())], ctx=Load()))
            else:
                annotation_ast_obj = Subscript(value=name(id=annotation[0],ctx=Load()), slice = Subscript(value=Name(id=annotation[1],ctx=Load()), slice=Name(id=annotation[2],ctx=Load()),ctx=Load()))
    else:
        annotation_ast_obj = Name(id=annotation,ctx=Load())
    
    t[0] = AnnAssign(target=Name(id=t[2], ctx=Store()), annotation=annotation_ast_obj, value=t[4])
    
def p_bool_expression(t):
    'expression : BOOL'
    val = True
    if t[1] == 'False':
        val = False
    t[0] = Constant(value=val)
    
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