#!/bin/bash

read number

filename="config.txt"
i=0
files=0
name=""

while read -r line
do
	name="$line"
	
	if [ $i = 0 ]; then
		files=$line
		i+=1
	else
		name=$line
	fi
done < "$filename"

for i in `seq 1 $number`;
do
	echo $i > now.txt
	`./cloesed_eval.sh`
	echo "Done $i"
done

