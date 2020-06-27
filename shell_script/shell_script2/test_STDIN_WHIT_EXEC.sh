#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
source $(dirname ${0})/check_file_exists.sh && check_file_exists ${0}_standardoutput.txt || exit 1
exec 0</etc/passwd ##开启子shell标准重定向输入，从该文件输入，而不是STDIN
exec 1>$(dirname ${0})/${0}_standardoutput.txt
count=1
while read line ##该输入从文件中来
do
	if ((${count}%2==0))
	then
		echo -e "\033[32m LINE${count}:${line} \033[0m"	
	else
		echo -e "\033[34m LINE${count}:${line} \033[0m"	
	fi
	count=$[${count}+1]
done

