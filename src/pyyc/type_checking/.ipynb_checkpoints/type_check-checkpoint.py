import ast
from .inference_rules import InferenceRules


class TypeCheck(ast.NodeVisitor):
    
    def __init__(self):
        self.variable_types = {}
        self.this_type = None
    
    
    def visit_MyAnnotation(self, node):
        # return the correct type
        # this is just a name node.
        if(isinstance(node, ast.Name)):
            return node.id #TODO: Change this to the type_class ascociated with node.id
        else:
            raise Exception("unkown type for node")
    
    
    def visit_AnnAssign(self, node):
        old_this_type = self.this_type
        self.this_type = self.visit_MyAnnotation(node.annotation)
        self.visit(node.target)
        self.this_type = old_this_type
        
        self.visit(node.value)
        
        if(node.target.type != node.value.type):
            raise TypeError("assign to the wrong type!")
    
    
    def visit_Assign(self, node):
        pass
    
    def visit_BinOp(self, node):
        self.generic_visit(node) #visit all the underlying elements and set their types
        
        if isinstance(node.op, ast.Add):
            node.type = InferenceRules.BinAdd(node.left.type, node.right.type)
        else:
            raise Exception("Unsopported binop")
            
    
    def visit_Name(self, node):
        this_type = self.this_type
        if(node.id in self.variable_types):
            node.type = self.variable_types[node.id]
        elif(this_type):
            self.variable_types[node.id] = this_type
            node.type = this_type
        else:
            raise Exception()
            
    def visit_Constant(self, node):
        # TODO: Change below.
        if(type(node.value) ==int):
            node.type = int
        elif(type(node.value) ==bool):
            node.type = bool
        else:
            raise Exception("Uknown type of constant.")
            