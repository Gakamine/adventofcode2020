file = open("input","r")
counter=0
grp_counter=0
questions={}
for line in file.readlines(): 
    if line != '\n' :
        line=line.rstrip()
        grp_counter+=1
        for letter in line:
            if letter not in questions:
                questions[letter]=1
            else:
                questions[letter]+=1
    else:
        for letter in questions:
            if questions[letter]==grp_counter:
                counter+=1
        grp_counter=0
        questions={}
file.close()
for letter in questions:
    if questions[letter]==grp_counter:
        counter+=1
print(counter)