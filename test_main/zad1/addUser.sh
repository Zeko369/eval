read user

perica=10
slavkec=100
if [ "$user" -lt "$perica" ]; then
	user="0$user"
fi
if [ "$user" -lt "$slavkec" ]; then
	user="0$user"
fi

mkdir users/user_$user
echo "user_$user" >> users.txt
