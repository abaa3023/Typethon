import ast

class RemoveAnnAssign(ast.NodeTransformer):
    
    def visit_AnnAssign(self, node):
        
        if(node.value is None):
            return ast.Expr(
                value = node.target
            )
        else:
            return ast.Assign(
                targets = [node.target],
                value = node.value
            )