class Type:
    def __eq__(self, type2):
        return type(self) == type(type2)
    
    def __str__(self):
        return str(type(self))

class Dict(Type):
    """ Dictionaries -> {key_type: value_type} """
    def __init__(self, key_type, value_type):
        self.key_type = key_type
        self.value_type = value_type

class List(Type):
    """The type of list[of_what] """
    def __init__(self, of_what):
        self.of_what = of_what

class Bool(Type):
    pass

class Int(Type):
    pass