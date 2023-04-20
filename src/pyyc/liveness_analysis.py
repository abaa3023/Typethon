#!/usr/bin/env python3.10

import ir_class
from ir_class import *
from x86_ir import *


def liveness_on_basicBlock(block,spilled_set):

    live_set_before = set([])
    for children in block.children:
        if children.upLive is not None:
            live_set_before = set.union(live_set_before,children.upLive)
        
    if len(block.statements) == 0:
        return live_set_before
    
    ir_list = block.statements
    ir_list[-1].live_set_after = live_set_before
    
    for i in range(len(ir_list)-1,-1,-1):
        if ir_list[i].instr_type == IRInstrType.CALL:
            ir_arg_list = [x for x in ir_list[i].args if isinstance(x,str)]
            live_set_after = set.union(ir_list[i].live_set_after,set(ir_arg_list))
        else:
            ir_var_source_list = [x for x in ir_list[i].src if isinstance(x,str)]
            ir_var_dest_list = [x for x in ir_list[i].dest if isinstance(x,str)]
            live_set_after = set.union(ir_list[i].live_set_after - set(ir_var_dest_list),set(ir_var_source_list))
            
        live_set_after -= set.union(spilled_set,all_registers)
        if i == 0:
            return live_set_after
        else:
            ir_list[i-1].live_set_after = live_set_after


def liveness_on_CFG(lastBlock,spilled_set):
    
    queue = []
    for parent in lastBlock.parents:
        queue.append(parent)
    
    while(len(queue)>0):
        block = queue.pop(0)
        
        upLive = block.upLive
        
        block.upLive = liveness_on_basicBlock(block,spilled_set)
        if upLive != block.upLive:
            queue.extend(block.parents)

def liveness_on_CFGList(cfg_list,spilled_set_list):

    for i in range(len(cfg_list)):
        last_block = cfg_list[i][1]
        liveness_on_CFG(last_block, spilled_set_list[i])
            
def reset_liveness(cfg_list):

    for cfg in cfg_list:

        visit_flag = not cfg[0].visited

        first_block = cfg[0]
        queue = [first_block]
            
        while(len(queue) > 0):
            
            block = queue.pop(0)
            block.visited = visit_flag
            block.upLive = None
            for child in block.children:
                if child.visited != visit_flag and child not in queue:
                    queue.extend([child])