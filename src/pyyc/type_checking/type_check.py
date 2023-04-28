import ast
from .inference_rules import InferenceRules
from .python_types import Int, Bool, List, Dict


class TypeCheck(ast.NodeVisitor):
    
    def __init__(self):
        # print("TypeCheck initialised")
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
                # return node.id #TODO: Change this to the type_class ascociated with node.id
                raise Exception(f"Unkown annotaion name - {node.id}")
        elif(isinstance(node, ast.Subscript)):
            if (isinstance(node.value, ast.Name)):
                sub_type = node.value.id
            else:
                raise Exception("unkown type for subscript.value")
                
            if(sub_type == 'list'):
                assert isinstance(node.slice, ast.Tuple) == False
                list_type = self.get_annotation_type(node.slice)
                return List(list_type)
            
                
            elif(sub_type == 'dict'):
                assert isinstance(node.slice, ast.Tuple) and len(node.slice.elts) == 2
                
                dict_key_type = self.get_annotation_type(node.slice.elts[0])
                dict_value_type = self.get_annotation_type(node.slice.elts[1])
                
                return Dict(dict_key_type, dict_value_type)
                
            
        else:
            raise Exception("unkown type for node")
    
    
    def visit_AnnAssign(self, node):
        # print("visiting AnnAssign")
        old_this_type = self.this_type
        # print(f"{old_this_type = }")
        self.this_type = self.get_annotation_type(node.annotation)
        # print(f"{self.this_type = }")
        self.visit(node.target)
        self.this_type = old_this_type
        # print(f"{self.this_type = }")
        
        self.visit(node.value)
        
        if(node.target.type != node.value.type):
            raise TypeError(f"assigning {node.value.type} to {node.target.type}.")
        node.type = node.target.type
    
    
    def visit_Assign(self, node):
        self.visit(node.targets[0])
        self.visit(node.value)
        
        
        if(node.targets[0].type != node.value.type):
            raise TypeError(f"assigning {node.value.type} to {node.targets[0].type}.")
    
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
            
    def visit_Compare(self, node):
        
        op = node.ops[0]
        self.visit(node.left)
        self.visit(node.comparators[0])
        
        left_type = node.left.type
        right_type = node.comparators[0].type
        
        if(isinstance(op, ast.Is)):
            node.type = InferenceRules.IsExpr(left_type, right_type)
        elif(isinstance(op, ast.Eq)):
            node.type = InferenceRules.Equals(left_type, right_type)
        elif(isinstance(op, ast.NotEq)):
            node.type = InferenceRules.NotEquals(left_type, right_type)
        else:
            raise Exception(f"Unknown comparison operator - {op}")
    
    def visit_Dict(self, node):
        self.generic_visit(node)
        
        dict_key_type = None
        dict_value_type = None
        
        for k,v in zip(node.keys, node.values):
            key_type = k.type
            value_type = v.type
            
            if(dict_key_type==None):
                dict_key_type = key_type
            elif(key_type!=dict_key_type):
                raise Exception(f"Incosistently typed dictionary keys: {dict_key_type}& {key_type}")
                
            if(dict_value_type == None):
                dict_value_type = value_type
            elif(value_type!=dict_value_type):
                raise TypeError(f"Incosistently typed dictionary values: {dict_value_type}& {value_type}")
        
        node.type = Dict(dict_key_type, dict_value_type)
        
    def visit_List(self, node):
        self.generic_visit(node)
        
        list_type = None
        
        for ele in node.elts:
            ele_type = ele.type
            
            if(list_type == None):
                list_type = ele_type
            elif(list_type!=ele_type):
                raise TypeError(f"Incosistently typed list: {list_type}& {ele_type}")
            
        node.type = List(list_type)
    
    def visit_Subscript(self, node):
        self.generic_visit(node)
        
        node.type = InferenceRules.Subscript(node.value.type, node.slice.type)
            

            
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
    