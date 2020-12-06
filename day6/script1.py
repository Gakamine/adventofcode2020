file = open("input","r")
counter=0
questions=[]
for line in file.readlines(): 
    if line != '\n' :
        line=line.rstrip()
        for letter in line:
            if letter not in questions:
                questions.append(letter) 
    else:
        counter=counter+len(questions)
        questions=[]
file.close()
print(counter+len(questions))