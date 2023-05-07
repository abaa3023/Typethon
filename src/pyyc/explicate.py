#!/usr/bin/env python3.10
import ast
from ast import *

import flatten
from flatten import *

from type_checking.python_types import *


remove_boxing = True

def handle_constant(node):
    if node.value == True:
        return 1
    elif node.value == False:
        return 0
    else:
        return node.value

# doesn't tag the value
def getVal(astNode):
    if isinstance(astNode,Name):
        return astNode.id
    elif isinstance(astNode,Constant):
        return handle_constant(astNode)


def set_subscript_str(dest,key,val):
    return "set_subscript(" + dest + ", " + box_value(key) + ", " + box_value(val) + ")"

def set_subscript_dict_str(dest,key,val):
    return "set_subscript_dict_known(" + dest + ", " + box_value(key) + ", " + box_value(val) + ")"

def set_subscript_list_str(dest,key,val):
    return "set_subscript_list(" + dest + ", " + box_value(key) + ", " + box_value(val) + ")"

def inject_int_str(val):
    return 'inject_int(' + str(val) + ')'

def inject_bool_str(val):
    return 'inject_bool(' + str(val) + ')'

def inject_big_str(val):
    return 'inject_big(' + str(val) + ')'

# returns tagged value 
def box_value(ASTNode):
    if isinstance(ASTNode,Constant):
        if isinstance(ASTNode.value,bool):
            if ASTNode.value == True:
                if(remove_boxing):
                    return '1'
                return inject_bool_str(1)

            else: 
                if(remove_boxing):
                    return '0'
                return inject_bool_str(0)
        else:
            if(remove_boxing):
                return str(ASTNode.value)
            return inject_int_str(ASTNode.value)
    
    elif isinstance(ASTNode,Name):
        return ASTNode.id
    
    elif isinstance(ASTNode,Subscript):
        fn = 'get_subscript'
        if(isinstance(ASTNode.value.type, List)):
            fn = 'get_subscript_list'
        return fn + '(' + ASTNode.value.id + ", " + box_value(ASTNode.slice) + ')'
    
    elif isinstance(ASTNode,ast.List):
        if(remove_boxing):
            return 'create_list(' + box_value(ASTNode.listlen) + ')'
        return inject_big_str('create_list(' + box_value(ASTNode.listlen) + ')')
    
    elif isinstance(ASTNode,ast.Dict):
        print("ASTNode = ", ASTNode)
        if(isinstance(ASTNode.type, Dict)):
            return 'create_dict_known()'
        return inject_big_str('create_dict()')
            
    elif isinstance(ASTNode,Call):
        argsList = [box_value(x) for x in ASTNode.args]
        value = ASTNode.func.id + '(' + ",".join(argsList) + ')'
        if ASTNode.func.id == 'create_closure':
            return inject_big_str(value)
        else:
            return value
            
    elif isinstance(ASTNode,str):
        return ASTNode

def assignString(dest,value):
    if isinstance(dest,Name):
        return dest.id + ' = ' + box_value(value)
    
    elif isinstance(dest,Subscript):
        if(isinstance(dest.value.type, List)):
            return set_subscript_list_str(dest.value.id, dest.slice, value)
        elif(isinstance(dest.value.type, Dict)):
            return set_subscript_dict_str(dest.value.id, dest.slice, value)
        return set_subscript_str(dest.value.id, dest.slice, value)
    
    elif isinstance(dest,str):
        return dest + ' = ' + box_value(value)

def append_list_with_prefix(targetList, statement, loop_count):
    targetList.append('\t'*loop_count + statement)
    
def addif(targetList, statement, loop_count):
    statement = 'if(' + statement + '):'
    append_list_with_prefix(targetList,statement,loop_count)
    return loop_count + 1

def endif(loop_count):
    return loop_count - 1 

def addelse(targetList,loop_count):
    statement = 'else:'
    append_list_with_prefix(targetList,statement,loop_count-1)


def tree_to_str(flattened_tree,prefix = 0):
    explicate_prog = []
    explicate_prog.append("")
    for node in flattened_tree:
        if isinstance(node,Assign):
            dest = node.targets[0]
            src = node.value
            
            if isinstance(src,BinOp):
                local_if_count = 0
                left_var = gen_new_var("explicate_")
                explicate_prog.append(assignString(left_var,src.left))
                
                right_var = gen_new_var("explicate_")
                explicate_prog.append(assignString(right_var,src.right))
                
                if((isinstance(src.left.type, List)) or (isinstance(src.left.type, Dict))):
                    if((isinstance(src.right.type, List)) or (isinstance(src.right.type, Dict))):
                        if(remove_boxing):
                            left = left_var
                            right = right_var
                            if(isinstance(src.right.type, List)):
                                fn = 'my_list_add'
                            else:
                                raise Exception("Dictionaries can;t be addded")
                            add_call = fn + '('+ left + ',' + right + ')'
                        else:
                            left = 'project_big(' + left_var + ')'
                            right = 'project_big(' + right_var + ')'
                            add_call = 'add('+ left + ',' + right + ')'
                        
                        if(remove_boxing):
                            statement = assignString(dest,add_call)
                        else:
                            statement = assignString(dest,inject_big_str(add_call))
                        append_list_with_prefix(explicate_prog,statement,local_if_count)
                else:
                    if((isinstance(src.right.type, List)) or (isinstance(src.right.type, Dict))):
                        pass
                    else:
                        if(isinstance(src.left.type, Int)):
                            left = gen_new_var("explicate_")
                            # left_assn = 'project_int(' + left_var + ')'
                            left_assn = left_var
                            statement = assignString(left,left_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        else:
                            left = gen_new_var("explicate_")
                            left_assn = 'project_bool(' + left_var + ')'
                            statement = assignString(left,left_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        if(isinstance(src.right.type, Int)):
                            right = gen_new_var("explicate_")
                            # right_assn = 'project_int(' + right_var + ')'
                            right_assn = right_var
                            statement = assignString(right,right_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        else:
                            right = gen_new_var("explicate_")
                            right_assn = 'project_bool(' + right_var + ')'
                            statement = assignString(right,right_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)

                        add_call = left + '+' + right
                        # statement = assignString(dest,inject_int_str(add_call))
                        statement = assignString(dest,add_call)
                        append_list_with_prefix(explicate_prog,statement,local_if_count)
                        
                
#                 if(isinstance(src.left.type, Int)):
#                     left = gen_new_var("explicate_")
#                     left_assn = 'project_int(' + left_var + ')'
#                     statement = assignString(left,left_assn)
#                     append_list_with_prefix(explicate_prog,statement,local_if_count)
#                 if(isinstance(src.right.type, Int)):
#                     right = gen_new_var("explicate_")
#                     right_assn = 'project_int(' + right_var + ')'
#                     statement = assignString(right,right_assn)
#                     append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 add_call = left + '+' + right
#                 statement = assignString(dest,inject_int_str(add_call))
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)

#                 value = "is_big(" + left_var + ")"
#                 local_if_count = addif(explicate_prog,value,local_if_count)

#                 value = "is_big(" + right_var + ")"
#                 local_if_count = addif(explicate_prog,value,local_if_count)

#                 


#                 local_if_count = endif(local_if_count)

#                 addelse(explicate_prog,local_if_count)

#                 value = "is_big(" + right_var + ")"
#                 local_if_count = addif(explicate_prog,value,local_if_count)
                
#                 statement = 'error_pyobj(0)'
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 addelse(explicate_prog,local_if_count)
                
#                 value = "is_int(" + left_var + ")"
#                 local_if_count = addif(explicate_prog,value,local_if_count)
                
#                 left = gen_new_var("explicate_")
#                 left_assn = 'project_int(' + left_var + ')'
#                 statement = assignString(left,left_assn)
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 addelse(explicate_prog,local_if_count)
                
#                 left_assn = 'project_bool(' + left_var + ')'
#                 statement = assignString(left,left_assn)
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 local_if_count = endif(local_if_count)
                
#                 value = "is_int(" + right_var + ")"
#                 local_if_count = addif(explicate_prog,value,local_if_count)
                
#                 right = gen_new_var("explicate_")
#                 right_assn = 'project_int(' + right_var + ')'
#                 statement = assignString(right,right_assn)
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 addelse(explicate_prog,local_if_count)
                
#                 right_assn = 'project_bool(' + right_var + ')'
#                 statement = assignString(right,right_assn)
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 local_if_count = endif(local_if_count)
                
#                 add_call = left + '+' + right
#                 statement = assignString(dest,inject_int_str(add_call))
#                 append_list_with_prefix(explicate_prog,statement,local_if_count)
                
#                 local_if_count = endif(local_if_count)
                
#                 local_if_count = endif(local_if_count)
                
            elif isinstance(src,UnaryOp) and isinstance(src.op,USub):
                local_if_count = 0
                if isinstance(src.operand,Constant):
                    if(remove_boxing):
                        explicate_prog.append(assignString(dest,'-' + str(handle_constant(src.operand))))
                    else:
                        explicate_prog.append(assignString(dest,inject_int_str('-' + str(handle_constant(src.operand)))))
                    
                elif isinstance(src.operand,Name):
                    if(isinstance(src.operand.type, Int)):
                        if(remove_boxing):
                            operand = src.operand.id
                        else:
                            operand = 'project_int(' + src.operand.id + ')'
                        sub_call = '-' + operand
                        if(remove_boxing):
                            statement = assignString(dest,sub_call)
                        else:
                            statement = assignString(dest,inject_int_str(sub_call))
                        append_list_with_prefix(explicate_prog,statement,local_if_count)
                    elif(isinstance(src.operand.type, Bool)):
                        operand = 'project_bool(' + src.operand.id + ')'
                        sub_call = '-' + operand
                        statement = assignString(dest,inject_int_str(sub_call))
                        append_list_with_prefix(explicate_prog,statement,local_if_count)
                        
                    
#                     local_if_count = 0
                    
#                     value = "is_int(" + src.operand.id + ")"
#                     local_if_count = addif(explicate_prog,value,local_if_count)
                    
#                     operand = 'project_int(' + src.operand.id + ')'
#                     sub_call = '-' + operand
#                     statement = assignString(dest,inject_int_str(sub_call))
#                     append_list_with_prefix(explicate_prog,statement,local_if_count)
                    
#                     addelse(explicate_prog,local_if_count)
                    
#                     value = "is_bool(" + src.operand.id + ")"
#                     local_if_count = addif(explicate_prog,value,local_if_count)
                    
#                     operand = 'project_bool(' + src.operand.id + ')'
#                     sub_call = '-' + operand
#                     statement = assignString(dest,inject_int_str(sub_call))
#                     append_list_with_prefix(explicate_prog,statement,local_if_count)
                    
#                     local_if_count = endif(local_if_count)
                    
#                     local_if_count = endif(local_if_count)
                    

            
            elif isinstance(src, Compare):
                
                local_if_count=0
                left_var = gen_new_var("explicate_")
                explicate_prog.append(assignString(left_var,src.left))

                right_var = gen_new_var("explicate_")
                explicate_prog.append(assignString(right_var,src.comparators[0]))

                if isinstance(src.ops[0],Is):
                    eq_call = left_var + '==' + right_var
                    statement = assignString(dest,inject_bool_str(eq_call))
                    append_list_with_prefix(explicate_prog,statement,local_if_count)

                elif isinstance(src.ops[0],IsNot):
                    eq_call = left_var + '!=' + right_var
                    statement = assignString(dest,inject_bool_str(eq_call))
                    append_list_with_prefix(explicate_prog,statement,local_if_count)

                else:
                    local_if_count = 0
                    if((isinstance(src.left.type, List)) or (isinstance(src.left.type, Dict))):
                        if((isinstance(src.comparators[0].type, List)) or (isinstance(src.comparators[0].type, Dict))):
                            left = 'project_big(' + left_var + ')'
                            right = 'project_big(' + right_var + ')'
                            if isinstance(src.ops[0],Eq):
                                eq_call = 'equal('+ left + ',' + right + ')'
                                statement = assignString(dest,inject_bool_str(eq_call))
                                append_list_with_prefix(explicate_prog,statement,local_if_count)

                            elif isinstance(src.ops[0],NotEq):
                                eq_call = 'not_equal('+ left + ',' + right + ')'
                                statement = assignString(dest,inject_bool_str(eq_call))
                                append_list_with_prefix(explicate_prog,statement,local_if_count)
                        else:
                            if isinstance(src.ops[0],Eq):
                                statement = assignString(dest,inject_bool_str(0))
                                append_list_with_prefix(explicate_prog,statement,local_if_count)

                            elif isinstance(src.ops[0],NotEq):
                                statement = assignString(dest,inject_bool_str(1))
                                append_list_with_prefix(explicate_prog,statement,local_if_count)
                    elif((isinstance(src.comparators[0].type, List)) or (isinstance(src.comparators[0].type, Dict))):
                        if isinstance(src.ops[0],Eq):
                            statement = assignString(dest,inject_bool_str(0))
                            append_list_with_prefix(explicate_prog,statement,local_if_count)

                        elif isinstance(src.ops[0],NotEq):
                            statement = assignString(dest,inject_bool_str(1))
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                    else:
                        left = gen_new_var("explicate_")
                        if(isinstance(src.left.type, Int)):
                            if(remove_boxing):
                                left_assn = left_var
                            else:
                                left_assn = 'project_int(' + left_var + ')'
                            statement = assignString(left,left_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        else:
                            if(remove_boxing):
                                left_assn = left_var
                            else:
                                left_assn = 'project_bool(' + left_var + ')'
                            statement = assignString(left,left_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        right = gen_new_var("explicate_")
                        if(isinstance(src.comparators[0].type, Int)):  
                            if(remove_boxing):
                                right_assn = right_var
                            else:
                                right_assn = 'project_int(' + right_var + ')'
                            statement = assignString(right,right_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                        else:
                            if(remove_boxing):
                                right_assn = right_var
                            else:
                                right_assn = 'project_bool(' + right_var + ')'
                            statement = assignString(right,right_assn)
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                       
                        if isinstance(src.ops[0],Eq):
                            eq_call = left + '==' + right
                            if(remove_boxing):
                                statement = assignString(dest,eq_call)
                            else:
                                statement = assignString(dest,inject_bool_str(eq_call))
                            append_list_with_prefix(explicate_prog,statement,local_if_count)

                        elif isinstance(src.ops[0],NotEq):
                            eq_call = left + '!=' + right
                            if(remove_boxing):
                                statement = assignString(dest,eq_call)
                            else:
                                statement = assignString(dest,inject_bool_str(eq_call))
                            append_list_with_prefix(explicate_prog,statement,local_if_count)
                
            elif isinstance(src,Call):
                if src.func.id == 'eval':
                    explicate_prog.append(assignString(dest,'eval(input())'))
                
                elif src.func.id == 'int':
                    # local_if_count = 0
                    # arg = gen_new_var("explicate_")
                    
                    
                    # print("src.args[0].type = ", src.args[0].type)
                    if(isinstance(src.args[0].type, Int) or
                      isinstance(src.args[0].type, Bool)):
                        explicate_prog.append(assignString(dest,src.args[0]))
                    else:
                        raise Exception("Something wrong.")
#                     if(remove_boxing):
#                         value = arg
#                     else:
#                         value = "is_bool(" + arg + ")"
#                     local_if_count = addif(explicate_prog,value,local_if_count)
                    
#                     if(remove_boxing):
#                         projected_arg = arg 
#                     else:
#                         projected_arg = 'project_bool(' + arg + ')'
#                     statement = assignString(dest,inject_int_str(projected_arg))
#                     append_list_with_prefix(explicate_prog,statement,local_if_count)
#                     local_if_count = endif(local_if_count)
                else:
                    explicate_prog.append(assignString(dest,src))
                
            elif isinstance(src,ast.List):
                explicate_prog.append(assignString(dest,src))
                if len(src.elts) > 0:
                    if isinstance(dest, Subscript):
                        temp_var = gen_new_var("explicate_")
                        explicate_prog.append(assignString(temp_var,dest))

                    elif isinstance(dest, Name):
                        temp_var = dest.id
                    
                    print("len(src.elts) = ", len(src.elts))
                    for i in range(len(src.elts)):
                        explicate_prog.append(set_subscript_list_str(temp_var,str(i),src.elts[i]))
                    
            elif isinstance(src,ast.Dict):
                print("Dict enter")
                print("len(src.keys) = ", len(src.keys))
                explicate_prog.append(assignString(dest,src))
                if len(src.keys) > 0:
                    if isinstance(dest, Subscript):
                        temp_var = gen_new_var("explicate_")
                        explicate_prog.append(assignString(temp_var,dest))

                    elif isinstance(dest, Name):
                        temp_var = dest.id
                    print("temp_var = ", temp_var)
                    for i in range(len(src.keys)):
                        if(remove_boxing):
                             explicate_prog.append(set_subscript_dict_str(temp_var,src.keys[i],src.values[i]))
                            
                        else:
                            explicate_prog.append(set_subscript_str(temp_var,src.keys[i],src.values[i]))
                            
            else:
                explicate_prog.append(assignString(dest,src))
                    
        elif isinstance(node,If):
            if isinstance(node.test,Constant):
                explicate_prog.append("if("+str(getVal(node.test))+"):")
            
            elif isinstance(node.test,Name):
                print(f"{node.test.id = }")
                if(isinstance(node.test.type, Int) or isinstance(node.test.type, Bool)):
                    value = "is_true_int_bool(" + node.test.id + ")"
                else:
                    value = "is_true(" + node.test.id + ")"
                explicate_prog.append("if(" + value + "):")
            
            explicate_prog.append(tree_to_str(node.body,prefix + 1))
            
            if len(node.orelse) > 0:
                explicate_prog.append("else:")
                explicate_prog.append(tree_to_str(node.orelse,prefix + 1))
                
        elif isinstance(node,While):
            if isinstance(node.test,Constant):
                explicate_prog.append("while("+str(getVal(node.test))+"):")
            
            elif isinstance(node.test,Name):
                # istrue(pyobj)
                if(isinstance(node.test.type, Int) or isinstance(node.test.type, Bool)):
                    value = "is_true_int_bool(" + node.test.id + ")"
                else:
                    value = "is_true(" + node.test.id + ")"
                explicate_prog.append("while(" + value + "):")
                
            explicate_prog.append(tree_to_str(node.body,prefix + 1))
        
        elif isinstance(node,Expr):
            if isinstance(node.value,Call):
                if node.value.func.id == 'print':
                    if(isinstance(node.value.args[0].type, Int)):
                        explicate_prog.append('print_int_nl(' + box_value(node.value.args[0]) + ')')
                    elif (isinstance(node.value.args[0].type, Bool)):
                        explicate_prog.append('print_bool_nl(' + box_value(node.value.args[0]) + ')')
                    elif(isinstance(node.value.args[0].type, List)):
                        coder = Encode()
                        coder.do(node.value.args[0].type.of_what)
                        type_str = coder.code_str()
                        explicate_prog.append('print_list_nl(' + box_value(node.value.args[0]) +',' + type_str+ ')')
                    elif(isinstance(node.value.args[0].type, Dict)):
                        keycoder = Encode()
                        keycoder.do(node.value.args[0].type.key_type)
                        keytype_str = keycoder.code_str()
                        valcoder = Encode()
                        valcoder.do(node.value.args[0].type.value_type)
                        valtype_str = valcoder.code_str()
                        
                        
                        explicate_prog.append('print_dict_nl(' + box_value(node.value.args[0]) +',' + keytype_str+ ','+ valtype_str+ ')')
                    else:
                        explicate_prog.append('print(' + box_value(node.value.args[0]) + ')')
                    
                elif node.value.func.id == 'eval':
                    explicate_prog.append('eval(input())')
                    
                else:
                    explicate_prog.append(box_value(node.value))
                    
    return ("\n"+"\t"*prefix).join(explicate_prog)