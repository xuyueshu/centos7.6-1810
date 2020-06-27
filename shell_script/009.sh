#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
read -p "please input the account you want create:" user
echo -e "\033[32m your account is: ${user} \033[0m"
if [ -z "${user}"  ];then
	echo -e "\033[31m your accout is empty! \033[0m"
	exit 1

elif cut -d ':' -f 1 /etc/passwd | grep "${user}" ;then
	echo -e "\033[31m your accout is exists,please input a valid account! \033[0m"
	exit 1
else 
	useradd ${user} >/dev/null
	read -p "please input the password for ${user}: " password
	if [ -z "${password}"  ];then
		echo "123456"  | passwd --stdin "${user}" && echo "your password is empty,so set default password '123456'";exit 0 || exit 1
	else	
		echo "${password}" | passwd --stdin "${user}" >/dev/null && echo "your password set successfully!";exit 0 || exit 1
	fi
fi

