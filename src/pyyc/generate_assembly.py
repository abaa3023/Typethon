#!/usr/bin/env python3.10

import ir_class
from ir_class import *

import basicblock_class
from basicblock_class import *

library_function_calls = {"print":"print_any",
                          "eval":"eval_input_pyobj",
                          "input":"input_pyobj",
                          "is_int":"is_int",
                          "is_bool":"is_bool",
                          "is_big":"is_big",
                          "is_function":"is_function",
                          "inject_int":"inject_int",
                          "inject_bool":"inject_bool",
                          "inject_big":"inject_big",
                          "project_int":"project_int",
                          "project_bool":"project_bool",
                          "project_big":"project_big",
                          "is_true":"is_true",
                          "create_list":"create_list",
                          "create_dict":"create_dict",
                          "set_subscript":"set_subscript",
                          "get_subscript":"get_subscript",
                          "add":"add",
                          "equal":"equal",
                          "not_equal":"not_equal",
                          "error_pyobj":"error_pyobj",
                         }

def register_prefix(reg):
    return "%"+reg

def stack_prefix(loc):
    return str(loc) + "(%ebp)"

def constant_prefix(const):
    return "$(" + str(const) + ")"
        
def func_prolog(func_name):
    
    if func_name == 'main':
        return ".globl "+\
                func_name+\
                "\n"+\
                func_name+":\n"+\
                " pushl %ebp\n"+\
                " movl %esp , %ebp"
    else:
        return func_name.upper()+":\n"+\
                " pushl %ebp\n"+\
                " movl %esp , %ebp"

def save_callee_saved_regs():
    ret_list = []
    for register in callee_saved_registers:
        ret_list.append(" pushl " + register_prefix(register))
    return "\n".join(ret_list)
        
def restore_callee_saved_regs():
    ret_list = []
    for register in reversed(callee_saved_registers):
        ret_list.append(" popl " + register_prefix(register))
    return "\n".join(ret_list)

def func_epilog(func_name):

    cleanup_str = " movl %ebp , %esp\n"+\
            " popl %ebp\n"+\
            " ret\n"

    if func_name == 'main':
        return " movl $0, %eax\n" + cleanup_str
    
    return cleanup_str

def callee_saved_register_usage(homes):
    for var in homes:
        if homes[var] in callee_saved_registers:
            return True
    return False

def assign_template(src, dest):
    
    return " movl " + src + ", " + dest

def call_template(func):
    
    return " call " + func

def unary_template(operand):
    
    return " negl " + operand

def add_template(src, dest):
    
    return " addl " + src + ", " + dest

def cmp_template(src1, src2):
    return " cmpl " + src1 + ", " + src2

def sete_template():
    return " sete %al"

def setne_template():
    return " setne %al"

def movzbl_template(dest):
    return " movzbl %al, " + dest

def sub_template(src, dest):
    
    return " subl " + src + ", " + dest

def push_template(src):
    
    return " pushl " + src

def jump_template(label):
    
    return " jmp " + label

def jump_equal_template(label):
    
    return " je " + label

def label_template(label):
    
    return label + ":"


def generate_assembly(ir_list,homes,spilled_set, save_callee_saved_registers):
    
    assembly_src = []
    
    def assembly_prefix(operand):
        if isinstance(operand,int):
            return constant_prefix(operand)
        elif isinstance(operand,str):
            if operand in spilled_set:
                return stack_prefix(homes[operand])
            elif operand in all_registers:
                return register_prefix(operand)
            else:
                print(operand)
                return register_prefix(homes[operand])
            
    def fmt_cmp(src1, src2):
        if isinstance(src2, int):
            return cmp_template(assembly_prefix(src2), assembly_prefix(src1))
        else:
            return cmp_template(assembly_prefix(src1), assembly_prefix(src2))

    for ir in ir_list:
        if ir.instr_type == IRInstrType.MOVL:
            src = assembly_prefix(ir.src[0])
            dest = assembly_prefix(ir.dest[0])
            if src != dest:
                assembly_src.append(assign_template(src,dest))
            
        elif ir.instr_type == IRInstrType.ADDL:
            assembly_src.append(add_template(assembly_prefix(ir.src[0]),assembly_prefix(ir.dest[0])))
            
        elif ir.instr_type == IRInstrType.NEGL:
            assembly_src.append(unary_template(assembly_prefix(ir.src[0])))
        
        elif ir.instr_type == IRInstrType.CALL:
            arg_count = len(ir.args)
            if arg_count > 0 and ir.args[0] is not None:
                for arg in reversed(ir.args):
                     assembly_src.append(push_template(assembly_prefix(arg)))
            f_name = library_function_calls.get(ir.func_name, None)
            assembly_src.append(call_template(f_name))
            

            if arg_count > 0 and ir.args[0] is not None:
                assembly_src.append(add_template(assembly_prefix(arg_count*4), "%esp"))
        
        elif ir.instr_type == IRInstrType.INT_COMPARE:
            assembly_src.append(fmt_cmp(ir.src[0],ir.src[1]))
            if ir.cmpop == IRCmpOpType.Eq:
                assembly_src.append(sete_template())
            elif ir.cmpop == IRCmpOpType.NotEq:
                assembly_src.append(setne_template())
            assembly_src.append(movzbl_template(assembly_prefix(ir.dest[0])))
        
        elif ir.instr_type == IRInstrType.COMPARE:
            assembly_src.append(fmt_cmp(ir.src[0],ir.src[1]))            

    return "\n".join(assembly_src)


def generate_assembly_block(block,homes,spilled_set, save_callee_saved_registers):
    
    assembly = []
    assembly.append(label_template(block.identifier.upper()))
    assembly.append(generate_assembly(block.statements, homes, spilled_set, save_callee_saved_registers))
    
    if block.block_type == BlockType.WHILE_CONDITION_BLOCK:
        assembly.append(jump_equal_template(block.children[1].identifier.upper()))
        
    else:
        if len(block.children) > 0:
            
            if block.children[0].block_type == BlockType.IF_BLOCK:
                assembly.append(jump_equal_template(block.children[1].identifier.upper()))
            
            else:
                if block.children[0].block_number != seqNumber:
                    assembly.append(jump_template(block.children[0].identifier.upper()))

    return "\n".join(assembly)


seqNumber = 0

def iterateBlocksInOrder(assembly_src,block,homes,spilled_set,visit_flag, save_callee_saved_registers):
    global seqNumber
    
    if block.visited == visit_flag:
        return
    
    block.visited = visit_flag
    seqNumber += 1
    assembly_src.append(generate_assembly_block(block,homes,spilled_set, save_callee_saved_registers))
    
    for child in block.children:
        if child.block_number == seqNumber:
            iterateBlocksInOrder(assembly_src,child,homes,spilled_set,visit_flag, save_callee_saved_registers)

def generate_assembly_cfg(cfg_obj, homes, spilled_set, visit_flag):
    
    global seqNumber
    assembly_src = []

    first_block = cfg_obj[0]
    assembly_src.append(func_prolog(cfg_obj[2].func_name))
    
    num_stack_var = len(spilled_set)
    if num_stack_var > 0:
        assembly_src.append(sub_template(constant_prefix(num_stack_var * 4),"%esp"))
    
    save_callee_saved_registers = callee_saved_register_usage(homes)
    if save_callee_saved_registers:
        assembly_src.append(save_callee_saved_regs())

    iterateBlocksInOrder(assembly_src,first_block,homes,spilled_set,visit_flag, save_callee_saved_registers)
        
    if save_callee_saved_registers:
        assembly_src.append(restore_callee_saved_regs())
        
    assembly_src.append(func_epilog(cfg_obj[2].func_name))
    
    return assembly_src

def main(cfg_list, homes_list, spilled_set_list):

    assembly_src_prog = []

    for i in range(len(cfg_list)):
        assembly_src_prog.extend(generate_assembly_cfg(cfg_list[i], homes_list[i], spilled_set_list[i], not cfg_list[i][0].visited))

    return "\n".join(assembly_src_prog)