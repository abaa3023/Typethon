class Type:
    def __eq__(self, type2):
        return type(self) == type(type2)
    
    def __str__(self):
        return str(type(self).__name__)

class Dict(Type):
    """ Dictionaries -> {key_type: value_type} """
    def __init__(self, key_type, value_type):
        self.key_type = key_type
        self.value_type = value_type
    
    def __eq__(self, type2):
        if(type(type2) == Dict):
            return self.key_type == type2.key_type and self.value_type == type2.value_type
        return False
    
    def __str__(self):
        return f'Dict({self.key_type},{self.value_type})'
            

class List(Type):
    """The type of list[of_what] """
    def __init__(self, of_what):
        self.of_what = of_what
    
    # list1 == list2
    def __eq__(self, type2):
        if(type(type2) == List):
            if(type2.of_what == None or self.of_what == None):
                return True
            return self.of_what == type2.of_what
        return False
    
    def __str__(self):
        return f'List({self.of_what})'
    
class Bool(Type):
    pass

class Int(Type):
    pass