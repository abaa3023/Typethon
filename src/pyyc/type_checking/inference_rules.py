import ast

from python_types import List, Dict, Int, Bool


class InferenceRules:
    """ 
    Rules that determine the resulting type based on the expression
    """
    
    def BinAdd(type1, type2):
        """
        What's the type of -> type1 + type2?
        """
        if(type1 == Int()):
            if (type2 == Int()):
                return Int()
            elif (type2 == Bool()):
                return Int()
            else:
                raise TypeError(Int, type2)
        elif(type1 == Bool()):
            if(type2 == Bool()):
                return Int() # addition of two bools gives an int.
            elif (type2 == Int()):
                return Int()
            else:
                raise TypeError(Bool, type2)
        
        elif(isinstance(type1, List)):
            if(isinstance(type2, List)):
                # THINK: Can we only add lists of the same element-types??
                if type1 == type2:
                    return type1
                else:
                    raise TypeError(type1, type2) 
            else:
                raise TypeError(type1, type2)
        elif (isinstance(type1, Dict)):
            raise TypeError(type1, type2)
        
        
    
    def USub(type1):
        """
        What's the type of -> -type1
        """
        if(type1 == Int() or type1 == Bool()):
            return Int()
        else:
            raise TypeError(type1)
    
    
    def Subscript(type1, type2):
        """
        What's the type of -> type1[type2]
        """
        
        if(isinstance(type1, List)):
            if(type2 == Int()):
                # Subscripting a list of <whats>, we should get a <what>.
                return type1.of_what
            else:
                raise TypeError(type1, type2)
            
        elif(isinstance(type1, Dict)):
            if(type2 == type1.key_type):
                return type1.value_type
            else:
                raise TypeError(type1, type2)
            
        else:
            raise TypeError(type1, type2)
    
    
    def NotOp(type1):
        """
        What's the type of -> not type1
        """
        # Todo: check if this has any exceptions.
        # Python seems to be returning True/False for all
        # of our data types.
        return Bool()
    
    
    def BoolAnd(*types):
        """
        What's the type of - type1 and type2
        """
        # THINK: The type of this expression is ambiguous in python. 
        # The type of the result depends on the input types?
        # Should we restrict both types to be the same?
        
        
        type1 = types[0]
        for t in types[1:]:
            if (t!=type1):
                raise TypeError(f"Boolean And had conflicting types {type1} & {t}")
        return type1
    
    def BoolOr(*types):
        """
        What's the type of -> type1 or type2
        """
        # THINK: The type of this expression is ambiguous in python. 
        # The type of the result depends on the input types?
        # Should we restrict both types to be the same?
        
        type1 = types[0]
        for t in types[1:]:
            if (t!=type1):
                raise TypeError(f"Boolean Or had conflicting types {type1} & {t}")
        return type1
    
    def Equals(type1, type2):
        """
        What's the type of -> type1 == type2
        """
        # Python seems to return booleans everytime
        return Bool()
    
    def NotEquals(type1, type2):
        """
        What's the type of -> type1 != type2
        """
        
        #seems to be boolean everytime
        return Bool()
    
    def IfExpr(type1, type2, type3):
        """
        What's the type of -> type1 if type2 else type3
        """
        
        # THINK: Should type1 and type3 be the same for consistency?
        
        if (type1 == type3):
            return type1
        else:
            return TypeError()
        
    def IsExpr(type1, type2):
        """
        What's the type of -> type1 is type2
        """
        return Bool()
    
            
            
        
            
                