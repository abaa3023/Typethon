#!/usr/bin/env python3.10
import ir_class
from ir_class import *

def assign_homes(colored_graph,spilled_set, args_list):
    homes = {}

    arg_offset = 8
    for arg in args_list:
        homes[arg] = arg_offset
        arg_offset += 4
    
    stack_offset = -4
    new_spilled_set = spilled_set - set(args_list)
    for var in new_spilled_set:
        homes[var] = stack_offset
        stack_offset -= 4
    for var in colored_graph:
        if var not in all_registers and var not in spilled_set:
            homes[var] = all_registers[colors.index(colored_graph[var])]
    return homes