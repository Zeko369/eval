#!/bin/bash

echo "Name of the file"

read name

if [ "${name: -1}" = "y" ]; then
	pero=${name:0:(-3)}
	python $pero.py < $pero.in > $pero.out
	diff $pero.out $pero.sup > resault.txt
else
	pero=${name:0:(-4)}
	g++ -DEVAL -O2 -o $pero $pero.cpp
	./$pero < $pero.in > $pero.out
	diff $pero.out $pero.sup > resault.txt
fi

var=$(cat resault.txt)
if [ "$var" = "" ]; then
	echo "Nice, perfect"
else
	echo $var
fi
