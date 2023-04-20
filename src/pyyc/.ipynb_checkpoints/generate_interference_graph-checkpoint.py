#!/usr/bin/env python3.10

import ir_class
from ir_class import *


def gen_ig(block,spilled_set, interference_dict, visit_flag):
    
    ir_list = block.statements
    
    
    for ir in ir_list:
        if ir.instr_type == IRInstrType.MOVL:

            ir_src_list = [x for x in ir.src if isinstance(x,str)]
            key = str(ir.dest[0])
            
            temp_set = ir.live_set_after - set.union(set(ir_src_list),set(ir.dest))
            
            for var in temp_set:
                interference_dict[var] = interference_dict.get(var,set())
                interference_dict[var].add(key)
                
            if key not in spilled_set:
                interference_dict[key] = set.union(interference_dict.get(key,set()), temp_set)

        elif ir.instr_type == IRInstrType.ADDL or ir.instr_type == IRInstrType.NEGL:

            ir_src_list = [x for x in ir.src if isinstance(x,str)]
            key = str(ir.dest[0])
            temp_set = ir.live_set_after - set(ir.dest)

            for var in temp_set:
                interference_dict[var] = interference_dict.get(var,set())
                interference_dict[var].add(key)
                
            if key not in spilled_set:
                interference_dict[key] = set.union(interference_dict.get(key,set()), temp_set)
        
        elif ir.instr_type == IRInstrType.CALL:
            for var in ir.live_set_after:
                interference_dict[var] = set.union(interference_dict.get(var,set()),set(caller_saved_registers))
                
                for register in caller_saved_registers:
                    interference_dict[register] = interference_dict.get(register,set())
                    interference_dict[register].add(var)
             
        elif ir.instr_type == IRInstrType.INT_COMPARE:
            for var in ir.live_set_after:
                if var == ir.dest[0] or ir.dest[0] in spilled_set:
                    interference_dict[var] = set.union(interference_dict.get(var,set()),set(["eax"]))
                    
                else:
                    key = str(ir.dest[0])
                    interference_dict[var] = set.union(interference_dict.get(var,set()),set([key, "eax"]))
                    interference_dict[key] = interference_dict.get(key,set())
                    interference_dict[key].add(var)
                
                interference_dict["eax"] = set.union(interference_dict.get("eax",set()),ir.live_set_after)
                
    for register in all_registers:
        interference_dict[register] = interference_dict.get(register,set())
    return interference_dict


def ig_each_cfg(first_block, spilled_set, visit_flag):
    
    queue = [first_block]
    interference_graph = {}
        
    while(len(queue) > 0):
        
        block = queue.pop(0)
        block.visited = visit_flag
        
        if len(block.statements) > 0:
            interference_graph.update(gen_ig(block, spilled_set, interference_graph, visit_flag))
        
        for child in block.children:
            if child.visited != visit_flag and child not in queue:
                queue.extend([child])
        
    return interference_graph

def main(cfg_list, spilled_set_list, visit_flag):

    ig_list = []

    for i in range(len(cfg_list)):

        first_block = cfg_list[i][0]
        spilled_set = spilled_set_list[i]
        
        ig = ig_each_cfg(first_block, spilled_set, visit_flag)
        ig_list.append(ig)

    return ig_list