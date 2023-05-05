a:bool = False
b:bool = True
x:bool = not (a and b) == (not a) or (not b)
print(x)