#!/bin/bash
count=0
while read line; do
	min=$(echo $line | cut -d "-" -f1)
	max=$(echo $line | cut -d "-" -f2 | cut -d " " -f1)
	letter=$(echo $line | cut -d ":" -f1 | cut -d " " -f2)
	password=$(echo $line | cut -d " " -f3)
	occurence=$(echo "${password}" | awk -F"${letter}" '{print NF-1}')
	if [ $min -le $occurence ] && [ $max -ge $occurence ]; then
		((count++))
	fi
done < input
echo $count
