#!/usr/bin/env python3.10

import ir_class
from ir_class import *

def on_stack(operand, spilled_set):
    global num_of_registers
    if isinstance(operand, str):
        if operand in spilled_set:
            return True
    return False

temp_var_counter = -1
def temp_var_name():
    global temp_var_counter
    temp_var_counter +=1
    return 'unspillable_' + str(temp_var_counter)


def spill(ir_list,spilled_set,unspillable_set):
    
    new_ir_list = []
    continue_loop = False
    for instr in ir_list:
        
        if instr.instr_type == IRInstrType.MOVL:
            
            if on_stack(instr.src[0], spilled_set) and on_stack(instr.dest[0], spilled_set):
                
                tmp_var = temp_var_name()
                new_ir_list.append(IRInstr.node_MOVL(instr.src[0],tmp_var))
                new_ir_list.append(IRInstr.node_MOVL(tmp_var,instr.dest[0]))

                unspillable_set.add(tmp_var)
                
                continue_loop = True
                
            else:
                new_ir_list.append(instr)
            
        elif instr.instr_type == IRInstrType.ADDL:
            
            if on_stack(instr.src[0], spilled_set) and on_stack(instr.dest[0], spilled_set):
                
                tmp_var = temp_var_name()
                new_ir_list.append(IRInstr.node_MOVL(instr.src[0],tmp_var))
                new_ir_list.append(IRInstr.node_ADDL(tmp_var,instr.dest[0]))
                unspillable_set.add(tmp_var)
                continue_loop = True
                
            else:
                new_ir_list.append(instr)
            
        
        elif instr.instr_type == IRInstrType.NEGL:
            new_ir_list.append(instr)
            
        elif instr.instr_type == IRInstrType.CALL:
            new_ir_list.append(instr)
            
        elif instr.instr_type == IRInstrType.INT_COMPARE or IRInstrType.COMPARE:
            src = instr.src.copy()
            
            if ((on_stack(instr.src[0], spilled_set) and on_stack(instr.src[1], spilled_set)) or
                (isinstance(instr.src[0],int) and isinstance(instr.src[1],int))):
                src[1] = temp_var_name()
                new_ir_list.append((IRInstr.node_MOVL(instr.src[1],src[1])))
                unspillable_set.add(src[1])
                continue_loop = True
            
            if instr.instr_type == IRInstrType.INT_COMPARE: 
                dest = instr.dest.copy()
                if on_stack(instr.dest[0], spilled_set):
                    dest[0] = temp_var_name()
                    new_ir_list.append((IRInstr.node_MOVL(instr.dest[0],dest[0])))
                    unspillable_set.add(dest[0])
                    continue_loop = True
                    
                new_ir_list.append(IRInstr.node_int_COMPARE(src[0],src[1],dest[0],instr.cmpop))
                new_ir_list.append(IRInstr.node_MOVL(dest[0],instr.dest[0]))
            
            else:
                new_ir_list.append(IRInstr.node_COMPARE(src[0],src[1]))
            
    return unspillable_set, continue_loop, new_ir_list


def each_cfg(first_block, spilled_set, visit_flag, unspillable_set):
    
    queue = [first_block]
    continue_looping = False
        
    while(len(queue) > 0):
        
        block = queue.pop(0)
        block.visited = visit_flag
        
        if len(block.statements) > 0:
            local_unspillable, local_continue, new_ir_list = spill(block.statements,spilled_set,unspillable_set)
            block.statements = new_ir_list
            unspillable_set = set.union(unspillable_set,local_unspillable)
            continue_looping = (continue_looping or local_continue)
        
        for child in block.children:
            if child.visited != visit_flag and child not in queue:
                queue.extend([child])
        
    return unspillable_set, continue_looping