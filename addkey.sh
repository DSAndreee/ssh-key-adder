clear
echo "———————————————— SSH Key adder —————————————————"
echo "————————————————————————————————————————————————"
echo "    "
printf "Please enter SSH user to use [\033[0;33mroot\033[0m] :"
read -r user
user="${user:=root}"
echo "    "
while [[ $server == '' ]] # While string is different or empty...
do
	printf "Please enter server IP or Hostname (178.209.209.190 or myserver.com) : "
	read -r server
done 
echo "    "
printf "Please enter server port [\033[0;33m22\033[0m] :"
read -r port
port="${port:=22}"

nc -z -v -w5 $server $port > file.txt 2>&1
result1=$?

#Do whatever you want

if [  "$result1" != 0 ]; then
	echo "    "	
	echo "————————————————————————————————————————————————"
	echo "    "
	printf "It seams that \033[0;33m$server\033[0m is not listening SSH on \033[0;33m$port\033[0m"
	echo "    "
	echo "————————————————————————————————————————————————"
else


	if [ ! -f ~/.ssh/id_rsa.pub ]; then
		echo "————————————————————————————————————————————————"
		echo "    "
		echo "id_rsa.pub not found, checking for id_dsa.pub..."
		echo "    "
		echo "————————————————————————————————————————————————"

		if [ ! -f ~/.ssh/id_dsa.pub ]; then
			echo "    "
			echo "id_dsa.pub not found.. Looking for a public key in ~/.ssh/.."
			echo "    "
			echo "————————————————————————————————————————————————"		


			if [ ! -e ~/.ssh/*.pub ]; then
				echo "    "
				echo "No public key founded into ~/.ssh/.. Generating SSH Key.."
				echo "    "
				echo "————————————————————————————————————————————————"		
				ssh-keygen -t rsa
				echo "————————————————————————————————————————————————"
				echo "    "
				printf "Please login into \033[0;33m$server\033[0m for user \033[0;33m$user\033[0m :"
				echo "    "
				echo "————————————————————————————————————————————————"

				cat ~/.ssh/*.pub | ssh "$user"@"$server" -p "$port" 'mkdir -p $HOME/.ssh/;touch $HOME/.ssh/authorized_keys;cat >> .ssh/authorized_keys'	

				echo "————————————————————————————————————————————————"
				echo "    "
				printf "SSH Key added on \033[0;33m$server\033[0m ! Enjoy :)"
				echo "    "
				echo "————————————————————————————————————————————————"
			else
				cat ~/.ssh/*.pub | ssh "$user"@"$server" -p "$port" 'mkdir -p $HOME/.ssh/;touch $HOME/.ssh/authorized_keys;cat >> .ssh/authorized_keys'	

				echo "————————————————————————————————————————————————"
				echo "    "
				printf "SSH Key added on \033[0;33m$server\033[0m ! Enjoy :)"
				echo "    "
				echo "————————————————————————————————————————————————"

			fi	

			echo "————————————————————————————————————————————————"
			echo "    "
			printf "SSH Key added on \033[0;33m$server\033[0m ! Enjoy :)"
			echo "    "
			echo "————————————————————————————————————————————————"

			ssh "$user"@"$server" -p "$port"

		else
			echo "————————————————————————————————————————————————"
			echo "    "
			printf "Please login into \033[0;33m$server\033[0m for user \033[0;33m$user\033[0m :"
			echo "    "
			echo "————————————————————————————————————————————————"

			cat ~/.ssh/id_dsa.pub | ssh "$user"@"$server" -p "$port" 'mkdir -p $HOME/.ssh/;touch $HOME/.ssh/authorized_keys;cat >> .ssh/authorized_keys'	

			echo "————————————————————————————————————————————————"
			echo "    "
			printf "SSH Key added on \033[0;33m$server\033[0m ! Enjoy :)"
			echo "    "
			echo "————————————————————————————————————————————————"

			ssh "$user"@"$server" -p "$port"
		fi
	else

		echo "————————————————————————————————————————————————"
		echo "    "
		printf "Please login into \033[0;33m$server\033[0m for user \033[0;33m$user\033[0m :"
		echo "    "
		echo "————————————————————————————————————————————————"

		cat ~/.ssh/id_rsa.pub | ssh "$user"@"$server" -p "$port" 'mkdir -p $HOME/.ssh/;touch $HOME/.ssh/authorized_keys;cat >> .ssh/authorized_keys'

		echo "————————————————————————————————————————————————"
		echo "    "
		printf "SSH Key added on \033[0;33m$server\033[0m ! Enjoy :)"
		echo "    "
		echo "————————————————————————————————————————————————"

		ssh "$user"@"$server" -p "$port"
	fi

fi
