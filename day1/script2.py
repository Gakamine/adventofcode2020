import os
file = open("input","r")
numbers=[]
for line in file.readlines():
    line=line.rstrip()    
    numbers.append(int(line))
file.close()

def find(numbers):
    for number_1 in numbers:
        for number_2 in numbers:
            for number_3 in numbers:        
                if number_1+number_2+number_3 == 2020:
                    return number_1*number_2*number_3

print(find(numbers))