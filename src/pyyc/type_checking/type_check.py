import ast
from inference_rules import InferenceRules
from python_types import Int, Bool, List, Dict


class TypeCheck(ast.NodeVisitor):
    
    def __init__(self):
        super(TypeCheck, self).__init__()
        self.variable_types = {}
        self.this_type = None
    
    
    def get_annotation_type(self, node):
        # return the correct type
        # this is just a name node.
        if(isinstance(node, ast.Name)):
            if(node.id == 'int'):
                return Int()
            elif(node.id == 'bool'):
                return Bool()
            else:
                return node.id #TODO: Change this to the type_class ascociated with node.id
        else:
            raise Exception("unkown type for node")
    
    
    def visit_AnnAssign(self, node):
        # print("visiting AnnAssign")
        old_this_type = self.this_type
        self.this_type = self.get_annotation_type(node.annotation)
        # print(f"{self.this_type = }")
        self.visit(node.target)
        self.this_type = old_this_type
        
        self.visit(node.value)
        
        if(node.target.type != node.value.type):
            raise TypeError(f"assigning {node.target.type} to {node.value.type}.")
        node.type = node.target.type
    
    
    def visit_Assign(self, node):
        self.visit(node.targets[0])
        self.visit(node.value)
        
        
        if(node.targets[0].type != node.value.type):
            raise TypeError(f"assigning {node.targets[0].type} to {node.value.type}.")
    
    def visit_BinOp(self, node):
        self.generic_visit(node) #visit all the underlying elements and set their types
        
        if isinstance(node.op, ast.Add):
            node.type = InferenceRules.BinAdd(node.left.type, node.right.type)
        else:
            raise Exception("Unsopported binop")
            
    
    def visit_Name(self, node):
        this_type = self.this_type
        if(node.id in self.variable_types):
            if(this_type == self.variable_types[node.id]):
                node.type = self.variable_types[node.id]
            elif this_type != None:
                raise TypeError(f"conflicting types for {node.id}: {self.variable_types[node.id]} and {this_type}")
            else:
                node.type = self.variable_types[node.id]
        elif(this_type):
            self.variable_types[node.id] = this_type
            node.type = this_type
        else:
            raise TypeError(f"No type found for variable {node.id}")
            
    def visit_Constant(self, node):
        # TODO: Change below.
        if(type(node.value) ==int):
            node.type = Int()
        elif(type(node.value) ==bool):
            node.type = Bool()
        else:
            raise Exception("Uknown type of constant.")
    
    def visit_UnaryOp(self, node):
        self.visit(node.operand)
        
        if(isinstance(node.op, ast.USub)):
            node.type = InferenceRules.USub(node.operand.type)
        elif(isinstance(node.op, ast.Not)):
            node.type = InferenceRules.NotOp(node.operand.type)
        else:
            raise Exception("unkown unary op")
    
    def visit_Call(self, node):
        # self.visit(node.func)
        # print("inside call")
        # self.generic_visit(node)
        
        if(node.func.id == 'int'):
            node.type = Int()
        elif(node.func.id == 'bool'):
            node.type = Bool()
        
        
        if(len(node.args) >0):
            self.visit(node.args[0])
            
    
    def visit_BoolOp(self, node):
        self.generic_visit(node) # set the types of the elements underneath
        
        if(isinstance(node.op, ast.Or)):
            node.type = InferenceRules.BoolOr(*[v.type for v in node.values])
        elif (isinstance(node.op, ast.And)):
            node.type = InferenceRules.BoolAnd(*[v.type for v in node.values])
        else:
            raise Exception("unkown boolOp")
            

            
if __name__ == '__main__':
    
    import sys
    file = sys.argv[1]
    with open(file) as f:
        code = f.read()
    
    a = ast.parse(code)
    print("-----ast----")
    print(ast.dump(a, indent =2))
    print("---end---")
    TypeCheck().visit(a)
    
    print("No type issues!!")
    