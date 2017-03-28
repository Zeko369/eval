#!/bin/bash

echo "Name of the file"

read name
max=5

for i in `seq 1 $max`;
do

python $name.py < $name.in.$i > $name.out.$i 
diff $name.out.$i $name.sup.$i > resault.txt

var=$(cat resault.txt)
if [ "$var" = "" ]; then
	echo "Nice, perfect"
else
	echo $var
fi
done
