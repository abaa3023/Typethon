#!/usr/bin/env python3.10

from basicblock_class import *
from ir_class import *

ifcount = 0 
whilecount = 0
basicbodycount = 0

def cfg(cbb, stmt_list, start):
    global ifcount
    global whilecount
    global basicbodycount
    
    for i in range(start, len(stmt_list)):
        
        statement = stmt_list[i]
        
        if isinstance(statement, IRStmt):
            
            if statement.stmt_type == IRStmtType.If:
                
                cbb.add_statement(statement.condition)
                ifcount += 1
                local_if_count = ifcount
                if_leaf_nodes = cfg(BasicBlock("If" + str(local_if_count),[cbb], [], BlockType.IF_BLOCK), statement.ifList, 0)
                
                if len(statement.elseList) > 0:
                    else_leaf_nodes = cfg(BasicBlock("E" + str(local_if_count), [cbb], [], BlockType.ELSE_BLOCK), statement.elseList, 0)
                else:
                    else_leaf_nodes = [cbb]
                    
                if i == len(stmt_list) - 1:
                    return if_leaf_nodes + else_leaf_nodes
                else:
                    basicbodycount += 1
                    return cfg(BasicBlock("BB" + str(basicbodycount),if_leaf_nodes + else_leaf_nodes, [], BlockType.BASIC_BLOCK), stmt_list, i + 1)
                
            elif statement.stmt_type == IRStmtType.While:
                
                whilecount += 1
                local_whilecount = whilecount
                while_bb = BasicBlock("WC" + str(local_whilecount), [cbb], [], BlockType.WHILE_CONDITION_BLOCK)
                while_bb.add_statement(statement.condition)
                while_parents = cfg(BasicBlock("WB" + str(local_whilecount), [while_bb], [], BlockType.WHILE_BODY_BLOCK), statement.ifList, 0)
                while_bb.add_parents(while_parents)
                
                if i == len(stmt_list) - 1:
                    return [while_bb]
                else:
                    basicbodycount += 1
                    return cfg(BasicBlock("BB" + str(basicbodycount), [while_bb], [], BlockType.BASIC_BLOCK), stmt_list, i + 1)
                 
        
        else:
            cbb.add_statement(statement)
            
    return [cbb]
                
                
start_counter = 0
end_counter = 0

def cfg_main(progList):
    global start_counter
    global end_counter

    firstnode = BasicBlock("Start" + str(start_counter),[],[], BlockType.START_BLOCK)
    start_counter += 1
    final_leaf_nodes = cfg(firstnode, progList, 0)
    final_node = BasicBlock("End" + str(end_counter),final_leaf_nodes,[], BlockType.END_BLOCK)
    end_counter += 1
    return firstnode, final_node

def main(irList):

    cfg_list = []
    main_body = []

    for ir in irList:

        if isinstance(ir, IRFunc):
            firstBB, finalBB = cfg_main(ir.body_ir)
            cfg_obj = [firstBB, finalBB, ir]
            cfg_list.append(cfg_obj)

        else:
            main_body.append(ir)

    funcdef_obj_main = IRFunc(IRFuncType.MAIN, "main", [], main_body)
    firstBB, finalBB = cfg_main(main_body)
    cfg_list.append([firstBB, finalBB, funcdef_obj_main])

    return cfg_list
    
    
if __name__ == 'main':
    
    main()