#!/bin/bash

filename="config.txt"
i=0
files=0
name=""

read user

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

# echo $files
# echo $name

pathName=users/user_00$user/$name
path=users/user_00$user

echo $pathName
file_name=`ls $path`

echo "Scores for $name" > scores/user_00$user.txt

if [ "${file_name: -1}" = "p" ]; then
	pero=${file_name:0:(-4)}
	echo hello
	g++ -DEVAL -O2 -o $path/$pero $path/$file_name
fi

for i in `seq 1 $files`;
do
	if [ "${file_name: -1}" = "y" ]; then
		pero=${file_name:0:(-3)}
		python $pathName.py < $name.in/$name.in.$i > $pathName.out.$i
		diff $pathName.out.$i $name.sup/$name.sup.$i > $path/resault.txt
	else
		./$pathName	< $name.in/$name.in.$i > $pathName.out.$i
		diff $pathName.out.$i $name.sup/$name.sup.$i > $path/resault.txt
	fi

	var=$(cat $path/resault.txt)
	if [ "$var" = "" ]; then
		echo "Nice, perfect"
		echo "Correct" >> scores/user_00$user.txt 
	else
		echo $var
		echo $var >> scores/user_00$user.txt
	fi
done
