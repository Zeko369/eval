#!/bin/bash

filename="config.txt"
i=0
files=0
name=""

read user
# user=$(cat now.txt)

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

perica=10
slavkec=100
# echo $user

if [ "$user" -lt "$perica" ]; then
	user="0$user"
	# echo "/////////////////////"
	# echo $user
fi
if [ "$user" -lt "$slavkec" ]; then
	user="0$user"
fi
pathName=users/user_$user/$name
path=users/user_$user

lastScore=$(scores/user_$user.txt)
echo $lastScore

# echo $pathName
file_name=`ls $path`

echo "Scores for $name" > scores/user_$user.txt

if [ "${file_name: -1}" = "p" ]; then
	pero=${file_name:0:(-4)}
	echo hello
	g++ -DEVAL -O2 -o $path/$pero $path/$file_name
fi

points=0

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
		echo "Correct" >> scores/user_$user.txt 
		points=$((points + 1))
	else
		echo $var
		echo $var >> scores/user_$user.txt
	fi
done

echo $points >> scores/user_$user.txt
