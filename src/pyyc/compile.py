#!/usr/bin/env python3.10
import sys
import ast
import flatten
import explicate
import x86_ir
import cfg
import liveness_analysis
import generate_interference_graph
import graph_color
import spill_ir
import variable_homes
import generate_assembly
# from lexerandparser import createASTFromMyParser
from type_checking.type_check import TypeCheck
from type_checking.remove_ann_assign import RemoveAnnAssign

def compile(src_file):
    
    prog = ''
    with open(src_file) as f:
        prog = f.read()
        
        
    tree = ast.parse(prog)
    # tree = createASTFromMyParser(src_file)
    
    
    TypeCheck().visit(tree)
    
    tree = RemoveAnnAssign().visit(tree)
    
    
    # print("------------------CORRECT TREE--------------------")
    # print(ast.dump(tree1,indent=4))
    # print("------------------Tree with my parser--------------")
    # print(ast.dump(tree,indent=4))
    
    print('--------------Original code----------------')
    print(prog)
    
    flatten_tree = flatten.main(tree)
    
    print('--------------Code after flattening-------')
    print(ast.unparse(flatten_tree))
    
    explicated_code = explicate.tree_to_str(flatten_tree.body)
    # print(explicated_code)
    explicated_tree = ast.parse(explicated_code)
    
    print('--------------Explicate code-------')
    print(ast.unparse(explicated_tree))
    
    explicate_flat_tree = ast.fix_missing_locations(flatten.flatten(explicated_tree,[]))
    
    print('\n\n--- explicated flattened python ---')
    print(ast.unparse(explicate_flat_tree))
    
    # x86 IR
    print('\n\n--- x86 IR ---')
    irList = x86_ir.main(explicate_flat_tree)

    # Generate CFG
    print('\n\n--- Control Flow Graph ---')
    cfg_list = cfg.main(irList)
    
    if len(irList) == 0:
        firstBB = cfg_list[0][0]
        return '\n'.join(generate_assembly.generate_assembly_cfg(cfg_list[0],[],set(),not firstBB.visited))

    spilled_set_list = [set() for i in range(len(cfg_list))]
    unspillable_set_list = [set() for i in range(len(cfg_list))]
    continue_coloring_list = [True for i in range(len(cfg_list))]
    colored_graph_list = [{} for i in range(len(cfg_list))]
    homes_list = [{} for i in range(len(cfg_list))]
    while True in continue_coloring_list:

        print('\n\n-------------- Reset Liveness----------------')
        liveness_analysis.reset_liveness(cfg_list)

        for i in range(len(cfg_list)):

            if continue_coloring_list[i]:

                firstBB = cfg_list[i][0]
                finalBB = cfg_list[i][1]

                args_list = cfg_list[i][2].args_list
                spilled_set_list[i] = spilled_set_list[i].union(set(args_list))

                print('\n\n-------------- Liveness----------------')
                liveness_analysis.liveness_on_CFG(finalBB, spilled_set_list[i])

                print('\n\n--------------Interference----------------')
                interference_graph = generate_interference_graph.ig_each_cfg(firstBB, spilled_set_list[i], not firstBB.visited)
                print('\n\nInterference Graph: ', interference_graph)

                print('\n\n--------------Coloring----------------')
                colored_graph_list[i], spilled_set_list[i] = graph_color.color_ig(interference_graph,unspillable_set_list[i],spilled_set_list[i])
                print('Colored graph:\n', colored_graph_list[i])
                print('Spilled set:\n', spilled_set_list[i])


                print('\n\n--------------Spilling----------------')
                unspillable_set_list[i], continue_coloring_list[i] = spill_ir.each_cfg(firstBB, spilled_set_list[i], not firstBB.visited, unspillable_set_list[i])
                print('unspillable_set\n',unspillable_set_list[i])
                print('continue_looping\n',continue_coloring_list[i])

    print('\n\n')
    for i in range(len(cfg_list)):
        homes_list[i] = variable_homes.assign_homes(colored_graph_list[i], spilled_set_list[i], cfg_list[i][2].args_list)
        print('Homes for CFG' + str(i) + ': ', homes_list[i])

    optimized_asm = generate_assembly.main(cfg_list, homes_list, spilled_set_list)
    return optimized_asm


def main():
    
    asm = compile(sys.argv[1])
    
    f = open(sys.argv[1][:-3] + ".s", "w")
    f.write(asm)
    f.close()
    
    
    
if __name__ == "__main__":
    
    main()
