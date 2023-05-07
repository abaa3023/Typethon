a:list[int] = [1, 2, 3]
b:list[int] = [4, 5, 6]
print(a)
print(b)
tmp:list[int] = a
a = b
b = tmp
print(a)
print(b)