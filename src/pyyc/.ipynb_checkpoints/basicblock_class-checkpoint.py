#!/usr/bin/env python3.10

from enum import Enum

class BlockType(Enum):
    BASIC_BLOCK = 1
    IF_BLOCK = 2
    ELSE_BLOCK = 3
    WHILE_CONDITION_BLOCK = 4
    WHILE_BODY_BLOCK = 5
    START_BLOCK = 6
    END_BLOCK = 7

class BasicBlock:
    
    sequence_number = 0
    
    def __init__(self, identifier, parents, children, block_type):
        
        self.statements = []
        self.identifier = identifier
        self.parents = []
        self.children = []
        self.block_type = block_type
        self.visited = False
        self.upLive = None
        self.block_number = BasicBlock.sequence_number
        BasicBlock.sequence_number += 1
        self.add_parents(parents)
        
    def add_parents(self,parents):
        
        for parent in parents:
            if parent not in self.parents:
                self.parents.append(parent)
            if self not in parent.children:
                parent.children.append(self)
            
    def add_children(self,children):
        
        for child in children:
            if child not in self.children:
                self.children.append(child)
            if self not in child.parents:
                child.parents.append(self)
        
    def add_statement(self,statement):
        self.statements.append(statement)
        
    def add_statements(self,statements):
        self.statements.extend(statements)