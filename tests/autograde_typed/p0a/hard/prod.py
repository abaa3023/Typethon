x:int = 1
y:int = 2
z:int = 0

while int(x != 10):
    while int(y != 0):
        temp:int = x
        temp2:int = y
        product:int = 0
        
        while int(temp != 0):
            product = product + temp2
            temp = temp + -1
        
        z = z + product
        y = y + -1 
        
    x = x + 1
    y = 2

z = z + z

print(z)

