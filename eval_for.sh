#!/bin/bash

echo "Name of the file"

read name

python $name.py < $name.in > $name.out
diff $name.out $name.sup > resault.txt

var=$(cat resault.txt)
if [ "$var" = "" ]; then
	echo "Nice, perfect"
else
	echo $var
fi
