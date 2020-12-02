#!/bin/bash
count=0
while read line; do
	pos_1=$(echo $line | cut -d "-" -f1)-1
	pos_2=$(echo $line | cut -d "-" -f2 | cut -d " " -f1)-1
	letter=$(echo $line | cut -d ":" -f1 | cut -d " " -f2)
	password=$(echo $line | cut -d " " -f3)
	if [ $letter == ${password:$pos_1:1} ] && [ $letter != ${password:$pos_2:1} ]; then
		((count++))
	elif [ $letter != ${password:$pos_1:1} ] && [ $letter == ${password:$pos_2:1} ]; then 
		((count++))	
	fi
done < input
echo $count
