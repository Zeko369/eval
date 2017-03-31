#!/bin/bash

echo "Name of the file"

read name

max=`cat config.txt`

if [ "${name: -1}" = "p" ]; then
	pero=${name:0:(-4)}
	g++ -DEVAL -O2 -o $pero $pero.cpp
fi

for i in `seq 1 $max`;
do
	if [ "${name: -1}" = "y" ]; then
		pero=${name:0:(-3)}
		python $pero.py < $pero.in.$i > $pero.out.$i
		diff $pero.out.$i $pero.sup.$i> resault.txt
	else
		./$pero < $pero.in.$i > $pero.out.$i
		diff $pero.out.$i $pero.sup.$i > resault.txt
	fi

	var=$(cat resault.txt)
	if [ "$var" = "" ]; then
		echo "Nice, perfect"
	else
		echo $var
	fi
done
