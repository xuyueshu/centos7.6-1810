#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
count=1
#cat /etc/passwd | while read line
#do
#	if ((${count}%2 == 1))
#	then
#		echo -e "\033[32m LINE ${count}: ${line} \033[0m"
#	else	
#		echo -e "\033[34m LINE ${count}: ${line} \033[0m"
#	fi
#	((count++))
#done
while read line
do
	if ((${count}%2 == 1))
	then
		echo -e "\033[32m LINE ${count}: ${line} \033[0m"
	else	
		echo -e "\033[34m LINE ${count}: ${line} \033[0m"
	fi
	((count++))
done </etc/passwd ##从文件中数计入，用‘<’，不用‘<<’
