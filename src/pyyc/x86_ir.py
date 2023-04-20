#!/usr/bin/env python3.10

import sys
import ast
from ast import *
import flatten
import addparent
from enum import Enum
import re
import ir_class
from ir_class import *

def extract_node_val(node):
    if isinstance(node,Name):
        node_val = node.id
    elif isinstance(node,Constant):
        node_val = node.value
    else:
        node_val = None
    return node_val

  
def convert_to_x86_ir(flat_tree_body,cur_body):
    
    for node in flat_tree_body:
        if isinstance(node, Assign):
            
            dest = extract_node_val(node.targets[0])
            assign_val_node = node.value
            
            if isinstance(node.value, Call):
                func_name = extract_node_val(assign_val_node.func)
                arguments = []
                label_name = ''
                
                for args in node.value.args:
                    arguments.append(extract_node_val(args))
                    
                cur_body.append(IRInstr.node_CALL(func_name,arguments,label_name))
                cur_body.append(IRInstr.node_MOVL("eax",dest))
                    
                              
            elif isinstance(node.value, UnaryOp):
                if extract_node_val(assign_val_node.operand) == dest:
                    cur_body.append(IRInstr.node_NEGL(dest,dest))
                    
                else:
                    cur_body.append(IRInstr.node_MOVL(extract_node_val(assign_val_node.operand),dest))
                    cur_body.append(IRInstr.node_NEGL(dest,dest))    
                
            elif isinstance(node.value, BinOp):
                if extract_node_val(assign_val_node.left) == dest:
                    cur_body.append(IRInstr.node_ADDL(extract_node_val(assign_val_node.right),dest))
                
                elif extract_node_val(assign_val_node.right) == dest:
                    cur_body.append(IRInstr.node_ADDL(extract_node_val(assign_val_node.left),dest))
                
                else:
                    cur_body.append(IRInstr.node_MOVL(extract_node_val(assign_val_node.left),dest))
                    cur_body.append(IRInstr.node_ADDL(extract_node_val(assign_val_node.right),dest))

            elif isinstance(node.value,Compare):
                compare_node = node.value       
                src_1 = extract_node_val(compare_node.left)
                src_2 = extract_node_val(compare_node.comparators[0])
                
                if isinstance(compare_node.ops[0],Eq):
                    cur_body.append(IRInstr.node_int_COMPARE(src_1, src_2,dest,IRCmpOpType.Eq))
                elif isinstance(compare_node.ops[0],NotEq):
                    cur_body.append(IRInstr.node_int_COMPARE(src_1, src_2,dest,IRCmpOpType.NotEq))
                    
            elif isinstance(node.value, Name) or isinstance(node.value, Constant):
                cur_body.append(IRInstr.node_MOVL(extract_node_val(assign_val_node),dest))
                
        
        elif isinstance(node, Expr):
            
            if isinstance(node.value, Call):
                
                func_name = extract_node_val(node.value.func)
                arguments = []
                label_name = ''
                
                for args in node.value.args:
                    arguments.append(extract_node_val(args))
                    
                cur_body.append(IRInstr.node_CALL(func_name,arguments,label_name))
        
        elif isinstance(node, If):
            x86_if_body = []
            convert_to_x86_ir(node.body,x86_if_body)
            
            x86_else_body = []
            convert_to_x86_ir(node.orelse,x86_else_body)
            
            cur_body.append(IRStmt(IRStmtType.If,IRInstr.node_COMPARE(0,extract_node_val(node.test)),x86_if_body,x86_else_body))
        
        elif isinstance(node, While):
            x86_While_body = []
            convert_to_x86_ir(node.body,x86_While_body)
            cur_body.append(IRStmt(IRStmtType.While,IRInstr.node_COMPARE(0,extract_node_val(node.test)),x86_While_body,[]))


        

def ir_str_fmt(*args):
    str_list = [x for x in args]
    return re.sub("[\[\]]","",(" ".join(str_list)))

def x86_ir_str(ir_list,if_count,while_count):
    
    for ir in ir_list:
        if isinstance(ir, IRInstr):
            if ir.instr_type == IRInstrType.ADDL:
                print("addl ",str(ir.src[0]),", ",str(ir.src[1]))

            elif ir.instr_type == IRInstrType.MOVL:
                print("movl ",str(ir.src[0]),", ",str(ir.dest[0]))

            elif ir.instr_type == IRInstrType.NEGL:
                print("negl ",str(ir.src[0]))
            elif ir.instr_type == IRInstrType.COMPARE:
                print("compare ",str(ir.src[0]),", ",str(ir.src[1]))
                
            elif ir.instr_type == IRInstrType.CALL:
                if ir.args is not None:
                    print("call ",ir.func_name,','.join(str(v) for v in ir.args))
                else:
                    print("call ",ir.func_name)

            elif ir.instr_type == IRInstrType.INT_COMPARE:
                print("int_compare ",str(ir.src[0]),ir.cmpop.name,str(ir.src[1]),", ",str(ir.dest[0]))

        elif isinstance(ir, IRStmt):
            if ir.stmt_type == IRStmtType.If:
                if_count += 1
                print("if"+str(if_count))
                print("cmp " + str(ir.condition.src[0]) + ", " + str(ir.condition.src[1]))
                if(len(ir.elseList)>0):
                    print("je else"+str(if_count))
                else:
                    print("je end if"+str(if_count))
                print("then"+str(if_count))
                x86_ir_str(ir.ifList,if_count,while_count)
                if(len(ir.elseList)>0):
                    print("else"+str(if_count))
                    x86_ir_str(ir.elseList,if_count,while_count)
                print("end if"+str(if_count))
            elif ir.stmt_type == IRStmtType.While:
                while_count += 1
                print("While"+str(while_count))
                print("cmp " + str(ir.condition.src[0]) + ", " + str(ir.condition.src[1]))
                print("je endl While"+str(while_count))
                x86_ir_str(ir.ifList,if_count,while_count)
                print("jmp While"+str(while_count))
                print("endl While"+str(while_count))
    
def main(ft):
    
    x86_ir_src = []
    convert_to_x86_ir(ft.body,x86_ir_src)
    x86_ir_str(x86_ir_src,0,0)
    
    return x86_ir_src
    
if __name__ == "__main__":
    
    main()