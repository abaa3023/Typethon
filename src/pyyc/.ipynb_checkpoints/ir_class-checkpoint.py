#!/usr/bin/env python3.10
from enum import Enum

# registers 
caller_saved_registers = ["eax","ecx","edx"]
callee_saved_registers = ["edi","ebx","esi"]
all_registers = caller_saved_registers + callee_saved_registers
# colors of registers
colors = [1,2,3,4,5,6]

# custom ir class
class IRInstrType(Enum):
    MOVL    = 1
    ADDL    = 2
    NEGL    = 3
    CALL    = 4
    INT_COMPARE = 5
    COMPARE = 6

class IRCmpOpType(Enum):
    Eq    = 1
    NotEq = 2

class IRStmtType(Enum):
    If    = 1
    While = 2

class IRFuncType(Enum):
    REGULAR = 1
    MAIN = 2

class IRInstr:
    #instr type can be directly passed, but others must be explicitly specified
    def __init__(self, instr_type, **kwargs):
        self.instr_type = instr_type
        self.src = kwargs.get("src",None)
        self.dest = kwargs.get("dest",None)
        self.func_name = kwargs.get("func_name",None)
        self.args = kwargs.get("args",None)
        self.cmpop = kwargs.get("cmpop",None)
        self.ret_val = kwargs.get("ret_val",None)
        self.label_name = kwargs.get("label_name",None)

    def node_MOVL(src,dest):
        return IRInstr(IRInstrType.MOVL, src = [src], dest = [dest])
    
    def node_ADDL(src,dest):
        return IRInstr(IRInstrType.ADDL, src = [src, dest], dest = [dest])
    
    def node_NEGL(src,dest):
        return IRInstr(IRInstrType.NEGL, src = [src], dest = [dest])

    def node_CALL(func_name,argsList,label_name):
        return IRInstr(IRInstrType.CALL, func_name = func_name, args = argsList,label_name = label_name)
    
    def node_int_COMPARE(src1,src2,dest,op):
        return IRInstr(IRInstrType.INT_COMPARE, src = [src1,src2], dest = [dest], cmpop = op)
    
    def node_COMPARE(src1,src2):
        return IRInstr(IRInstrType.COMPARE, src = [src1, src2], dest=[])
    
class IRStmt:
    def __init__(self, irstmt_type, condition, ifList, elseList):
        self.stmt_type = irstmt_type
        self.condition = condition
        self.ifList = ifList
        self.elseList = elseList

class IRFunc:

    def __init__(self, func_type, func_name, args_list, body_ir):
        self.func_type = func_type
        self.func_name = func_name
        self.args_list = args_list
        self.body_ir = body_ir
        