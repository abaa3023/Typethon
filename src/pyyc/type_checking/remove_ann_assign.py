import ast

class RemoveAnnAssign(ast.NodeTransformer):
    
    def visit_AnnAssign(self, node):
        return ast.Assign(
            targets = [node.target],
            value = node.value
        )