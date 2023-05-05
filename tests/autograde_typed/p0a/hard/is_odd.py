is_odd:int = 1
x:int = int(input())
idx:int = 1
while int(idx != x):
    is_odd = int(not is_odd)
    idx = idx + 1
print(is_odd)
