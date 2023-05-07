a:bool = True
b:bool = False
x:bool = not (a or b) == (not a) and (not b)
print(x)