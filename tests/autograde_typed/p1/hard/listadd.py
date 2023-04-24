x:list[int] = [15, 25, 35, 45]
len:int = 4
sum:int = 0
idx:int = 0

while len != 0:
  sum = sum + x[idx]
  len = len + -1
  idx = idx + 1
  x[1] = 123

print(sum)