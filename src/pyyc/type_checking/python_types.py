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
    
    def __eq__(self, type2):
        if(type(type2) == List):
            return self.of_what == type2.of_what
        return False
    
    def __str__(self):
        return f'List({self.of_what})'
    
class Bool(Type):
    pass

class Int(Type):
    pass


class Encode:
#     encoding = {
#         Int: 1,
#         Bool: 2,
#         List: 3,
#         Dict: 4
#     }
    
    def __init__(self):
        self.code = []
    
    def do(self, t):
        if(isinstance(t, List)):
            self.code.append(3)
            self.do(t.of_what)
        elif(isinstance(t, Dict)):
            self.code.append(4)
            self.do(t.key_type)
            self.do(t.value_type)
        elif(isinstance(t, Int)):
            self.code.append(1)
        elif(isinstance(t, Bool)):
            self.code.append(2)
        else:
            raise Exception("uknown type")
    def code_str(self):
        return ''.join([str(i) for i in self.code[::-1]])