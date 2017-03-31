for i in `seq 100 200`; do
	cp -r ./user_002 ./user_$i	
done

for i in `seq 1 10`; do
	cp -r ./user_001 ./user_00$i	
done

for i in `seq 10 99`; do
	cp -r ./user_001 ./user_0$i	
done
