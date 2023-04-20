#!/usr/bin/env python3.10

import ir_class
from ir_class import *

def find_max_constraint(var_set, saturation_map):
    
    max_length = 0
    max_key = None
    
    for var in var_set:
        if len(saturation_map[var]) >= max_length:
            max_length = len(saturation_map[var])
            max_key = var
            
    return max_key
    
    
def color_ig(interference_graph,unspillable_set,spilled_set):
    
    W = set()
    colors_dict = {}
    saturation_map = {}
    for key in interference_graph.keys():
        
        if key in all_registers:
            
            current_reg_color = colors[all_registers.index(key)]
            colors_dict[key] = current_reg_color
            
            saturation_map[key] = set(colors) - set([current_reg_color])
            for interfere_var in interference_graph[key]:
                saturation_map[interfere_var] = set.union(saturation_map.get(interfere_var, set()), set([current_reg_color]))
            
        else:
            W.add(key)
            saturation_map[key] = saturation_map.get(key, set())
    
    unspillable_set_copy = unspillable_set.copy()
    while W:
        
        if len(unspillable_set_copy) > 0:
            max_key = find_max_constraint(unspillable_set_copy, saturation_map)
            unspillable_set_copy -= set([max_key])
        
        else:
            max_key = find_max_constraint(W, saturation_map)
        
        available_colors = set(colors) - saturation_map[max_key]
        
        if available_colors:
            
            lowest_available_color = min(available_colors)
            colors_dict[max_key] = lowest_available_color
            
            for interfere_var in interference_graph[max_key]:
                saturation_map[interfere_var] = set.union(saturation_map.get(interfere_var, set()), set([lowest_available_color]))
            
        else:
            
            colors_dict[max_key] = len(colors) + 1
            spilled_set.add(max_key)
        
        W = W - set([max_key])
        
    return colors_dict, spilled_set

def main(ig_list,unspillable_set_list,spilled_set_list):

    colors_dict_list = []

    for i in range(len(ig_list)):

        colors_dict, spilled_set = color_ig(ig_list[i], unspillable_set_list[i], spilled_set_list[i])

        colors_dict_list.append(colors_dict)
        spilled_set_list[i] = spilled_set

    return colors_dict_list, spilled_set_list