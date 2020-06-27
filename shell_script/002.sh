#!/bin/bash
PATH=/home/youzhiqiang/perl5/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/youzhiqiang/.local/bin:/home/youzhiqiang/bin
export PATH
cut -d ':' -f 1 /etc/passwd | grep "${1}"
if [ "$?" == "0" ];then
	echo "this account already exist!"
	exit 1
else
	useradd ${1} && echo ${2} | passwd --stdin ${1} || echo  "this acount created faild!" 
fi
