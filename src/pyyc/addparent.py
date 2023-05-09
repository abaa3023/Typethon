#!/usr/bin/env python3.10

import ast
from ast import *
# add parent to each node
def add_Parent(tree):
    for node in ast.walk(tree):
        if isinstance(node, Module):
            node.parent = None
        for child in ast.iter_child_nodes(node):
            child.parent = node