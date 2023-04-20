#!/usr/bin/env python3.10

#Print all the name nodes in the AST using recursion
import ast
from ast import *
                

# Generate new var name
new_nodes_count = 0 
def gen_new_var(prefix_str):
    global new_nodes_count
    new_node_name = prefix_str + str(new_nodes_count)
    new_nodes_count +=1
    return new_node_name

# New AST nodes
def new_name_node(name,context):
    return Name(id = name,ctx = context)

def new_assn_node(targetsList,node):
    return Assign(targets = targetsList, value = node)

def new_if_node(condition,iftrueList,ifelseList):
    return If(test = condition, body = iftrueList, orelse = ifelseList)

def new_call_node(name,context,argumentsList):
    return Call(func=Name(id=name, ctx=context),args = argumentsList)

def new_boolop_node(operation,valueList):
    return BoolOp(op = operation, values = valueList)

def new_compare_node(operationsList,left,compareList):
    return Compare(ops = operationsList, left = left, comparators = compareList)

def get_val(ASTNode):
    if isinstance(ASTNode, Name):
        return ASTNode.id
    elif isinstance(ASTNode, Constant):
        return ASTNode.value
    else:
        return None

def get_target(ASTNode):
    if isinstance(ASTNode, Assign):
        return ASTNode.targets[0]
    elif isinstance(ASTNode, Expr):
        return new_name_node(gen_new_var('new_temp'),Store())
    else:
        return None

def desugar_compareop(node):
    desugared_body = []
    compare_op_node = node.value
    target = get_target(node)
    
    src2_val = get_val(compare_op_node.comparators[1])
    
    
    if_true_append = compare_op_node.key_reduce_map.get(src2_val,[])
    if_true_compare_node = new_compare_node(compare_op_node.ops,compare_op_node.comparators[0], [compare_op_node.comparators[1]])

    if_true_assn = new_assn_node([target],if_true_compare_node)
    if_false_assn = new_assn_node([target],compare_op_node.left)
    
    if_true_if = new_if_node(compare_op_node.left,[],[])
    if_true_if.body.extend(if_true_append)
    if_true_if.body.append(if_true_assn)
    if_true_if.orelse.append(if_false_assn)
    
    desugared_body.append(if_true_if)
    
    return desugared_body
    
def desugar_boolop(node):
    desugared_body = []
    bool_op_node = node.value
    target = get_target(node)

    src1_val = get_val(bool_op_node.values[0])
    src2_val = get_val(bool_op_node.values[1])
    
    desugared_body.extend(bool_op_node.key_reduce_map.get(src1_val,[]))
    
    if_true_append = bool_op_node.key_reduce_map.get(src2_val,[])
    
    if_true_assn = new_assn_node([target],bool_op_node.values[1])
    if_false_assn = new_assn_node([target],bool_op_node.values[0])
    if isinstance(bool_op_node.op,And):
        desugared_if_and = new_if_node(bool_op_node.values[0],[],[])
        desugared_if_and.body.extend(if_true_append)
        desugared_if_and.body.append(if_true_assn)
        desugared_if_and.orelse.append(if_false_assn)
        desugared_body.append(desugared_if_and)
        return desugared_body

    elif isinstance(bool_op_node.op,Or):
        desugared_if_or = new_if_node(bool_op_node.values[0],[],[])
        desugared_if_or.body.append(if_false_assn)
        desugared_if_or.orelse.extend(if_true_append)
        desugared_if_or.orelse.append(if_true_assn)
        desugared_body.append(desugared_if_or)
        return desugared_body
        
def desugar_ifexp(node):
    
    if_exp_node = node.value
    target = get_target(node)
    
    desugared_body = []
    name_test = get_val(if_exp_node.test)
    name_if = get_val(if_exp_node.body)
    name_else = get_val(if_exp_node.orelse)
    
    desugared_body.extend(if_exp_node.ifexp_dict[name_test])
    if_true_assn = new_assn_node([target],if_exp_node.body)
    if_false_assn = new_assn_node([target],if_exp_node.orelse)
    
    desugared_if = new_if_node(if_exp_node.test,[],[])
    desugared_if.body.extend(if_exp_node.ifexp_dict[name_if])
    desugared_if.body.append(if_true_assn)
    
    desugared_if.orelse.extend(if_exp_node.ifexp_dict[name_else])
    desugared_if.orelse.append(if_false_assn)
    
    desugared_body.append(desugared_if)
    
    return desugared_body

def isNot(node):
    if isinstance(node,UnaryOp) and isinstance(node.op,Not):
        return True
    else:
        return False
    
def desugar_not(node):
    or_node = node.value
    target = get_target(node)
    if_true_assn = new_assn_node([target],Constant(value = False))
    if_false_assn = new_assn_node([target],Constant(value = True))
    return new_if_node(or_node.operand,[if_true_assn],[if_false_assn])



    
def add_expr_node(node,cur_body):
    assign_val = node.value
    
    if isNot(assign_val):
        cur_body.append(desugar_not(node))
        
    else:
        cur_body.append(node)
    
    
def add_assn_node(node,cur_body):
    assign_val = node.value
    
    if isinstance(assign_val,IfExp) or isinstance(assign_val,BoolOp) or isinstance(assign_val,Compare):
        cur_body.append(new_assn_node([node.targets[0]],assign_val.assn_name))
        
    elif isNot(assign_val):
        cur_body.append(desugar_not(node))
        
    else:
        cur_body.append(node)

    
def add_new_node(node,cur_body):
    new_node_name = gen_new_var('new_temp')
    newNode = new_assn_node([new_name_node(new_node_name,Store())],node)
    add_assn_node(newNode, cur_body)
    return new_node_name 

def checkComplexityAndRecurse(ASTnode,cur_body):
    if not isinstance(ASTnode, Constant) and not isinstance(ASTnode, Name):
        flatten(ASTnode,cur_body)
        return True
    else:
        return False


def ReduceAndRename(operand,cur_body):
    if checkComplexityAndRecurse(operand, cur_body):
        new_var_name = add_new_node(operand, cur_body)
        return new_name_node(new_var_name,Load())
    else:
        return operand


# Flatten the tree
def flatten(n, cur_body): 
    
    if isinstance(n, Module):
        [flatten(x,cur_body) for x in n.body]
        return Module(body = cur_body,type_ignores=[])
    
    if isinstance(n, FunctionDef):
        fn_flat_li = []
        [flatten(x,fn_flat_li) for x in n.body]
        n.body = fn_flat_li
        cur_body.append(n)
    
    elif isinstance(n, If):
        n.test = ReduceAndRename(n.test, cur_body)
        ifbody = []
        elsebody = []
        [flatten(x,ifbody) for x in n.body]
        n.body = ifbody

        [flatten(x,elsebody) for x in n.orelse]
        n.orelse = elsebody
        
        
        cur_body.append(n)
    
    elif isinstance(n, While):

        flat_while_body = []
        [flatten(x,flat_while_body) for x in n.body]
        n.body = flat_while_body
        
        flattened_test_stmts = []
        n.test = ReduceAndRename(n.test, flattened_test_stmts)
        for expr in flattened_test_stmts:
            cur_body.append(expr)
            n.body.append(expr)
        
        cur_body.append(n)
        
    elif isinstance(n,List):
        reduced_elts = []
        for item in n.elts:
            reduced_elts.append(ReduceAndRename(item, cur_body))
        n.elts = reduced_elts
        n.listlen = Constant(value = len(n.elts))
        
    elif isinstance(n,Dict):
        reduced_keys = []
        reduced_values = []
        
        for i in range(len(n.keys)):
            reduced_keys.append(ReduceAndRename(n.keys[i], cur_body))
            reduced_values.append(ReduceAndRename(n.values[i], cur_body))
            
        n.keys = reduced_keys
        n.values = reduced_values

    elif isinstance(n, Assign):
        n.value = ReduceAndRename(n.value,cur_body)
        flatten(n.targets[0],cur_body)
        
        add_assn_node(n,cur_body)
        
    elif isinstance(n, Expr):
        flatten(n.value, cur_body)
        add_expr_node(n,cur_body)
        
    elif isinstance(n, Subscript):
        n.value = ReduceAndRename(n.value, cur_body)
        n.slice = ReduceAndRename(n.slice, cur_body)

    elif isinstance(n, BinOp):
        n.left =  ReduceAndRename(n.left, cur_body)
        n.right = ReduceAndRename(n.right, cur_body)
        
    elif isinstance(n, UnaryOp):
        n.operand =  ReduceAndRename(n.operand, cur_body)
        
    elif isinstance(n, Call):
        n.func = ReduceAndRename(n.func, cur_body)
        
        if isinstance(n.func,Name) and n.func.id != 'eval':
            for i in range(len(n.args)):
                n.args[i] = ReduceAndRename(n.args[i], cur_body)
            

    elif isinstance(n, Compare):
        
        n.left = ReduceAndRename(n.left, cur_body)
        n.comparators[0] = ReduceAndRename(n.comparators[0], cur_body)
        
        operation = n.ops.pop(0)
        
        intermediate_op = new_compare_node([operation],n.left,[n.comparators[0]])
        
        new_var_name = gen_new_var('new_temp')
        name_node = new_name_node(new_var_name,Store())
        newNode = new_assn_node([name_node],intermediate_op)
        cur_body.append(newNode)
        
        
        n.left = name_node
        
        while(len(n.comparators) > 1):
            src1 = n.comparators.pop(0)
            src2 = n.comparators.pop(0)
            
            reduce1 = []
            reduce2 = []
            
            src1_new_name = ReduceAndRename(src1, reduce1)
            src2_new_name = ReduceAndRename(src2, reduce2)
            
            src1_val = get_val(src1_new_name)
            src2_val = get_val(src2_new_name)
            
            operation = n.ops.pop(0)
            
            intermediate_op = new_compare_node([operation],n.left,[src1_new_name,src2_new_name])
            intermediate_op.key_reduce_map ={src1_val:reduce1,src2_val:reduce2} 
            
            new_var_name = gen_new_var('new_temp')
            name_node = new_name_node(new_var_name,Store())
            newNode = new_assn_node([name_node],intermediate_op)
            cur_body.extend(desugar_compareop(newNode))
            
            n.left = name_node
            n.comparators = [src2_new_name] + n.comparators

        n.assn_name = n.left


    elif isinstance(n, BoolOp):
        new_val = n.values
        while(len(new_val) > 1):
            src1 = new_val.pop(0)
            src2 = new_val.pop(0)
            
            reduce1 = []
            reduce2 = []
            
            src1_new_name = ReduceAndRename(src1, reduce1)
            src2_new_name = ReduceAndRename(src2, reduce2)
            
            src1_val = get_val(src1_new_name)
            src2_val = get_val(src2_new_name)
            
            intermediate_op = new_boolop_node(n.op,[src1_new_name,src2_new_name])
            intermediate_op.key_reduce_map ={src1_val:reduce1,src2_val:reduce2} 
            
            new_var_name = gen_new_var('new_temp')
            newNode = new_assn_node([new_name_node(new_var_name,Store())],intermediate_op)
            cur_body.extend(desugar_boolop(newNode))

            new_val =  [new_name_node(new_var_name,Store())] + new_val      
            
        n.values = new_val
        n.assn_name = new_val[0]
        

    elif isinstance(n,IfExp):
        ifexp_dict = {}
        test_body = []
        if_body = []
        else_body = []
        
        n.test = ReduceAndRename(n.test, test_body)
        ifexp_dict[get_val(n.test)] = test_body
        
        n.body = ReduceAndRename(n.body, if_body)
        ifexp_dict[get_val(n.body)] = if_body
        
        n.orelse = ReduceAndRename(n.orelse, else_body)
        ifexp_dict[get_val(n.orelse)] = else_body
        
        n.ifexp_dict = ifexp_dict
        new_var_name = gen_new_var('new_temp')
        newNode = new_assn_node([new_name_node(new_var_name,Store())],n)
        cur_body.extend(desugar_ifexp(newNode))
        
        n.assn_name = new_name_node(new_var_name,Store())
        
    elif isinstance(n,Return):
        n.value = ReduceAndRename(n.value, cur_body)
        cur_body.append(n)
        
    elif isinstance(n, Constant):
        pass
    elif isinstance(n, Name):
        pass
    elif isinstance(n, Add):
        pass
    elif isinstance(n, USub):
        pass
    elif isinstance(n, Load):
        pass
    elif isinstance(n, Store):
        pass
    else:
        raise Exception('Error in num_nodes: unrecognized AST node', n)

def main(tree):
    
    print(ast.dump(tree,annotate_fields=True, include_attributes=False,indent=5))
    newbody = [] # Body of the new flattened tree
    # Recurse to flatten the tree
    flat_tree = fix_missing_locations(flatten(tree,newbody))
    
    print(ast.dump(flat_tree,annotate_fields=True, include_attributes=False,indent=5))
    return flat_tree


if __name__ == '__main__':
    
    main()