#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
echo $$
while true
do
	read -p "please input a math number that between 1 and 100 or input 'exit':" input
	if [ "${input}" == "exit"  ];then
		pstree -pa $$
		break
	fi
	if ! echo "${input}" | grep -E '^([1-9][0-9]?|100)$';then ##正则表达式中的转义符要使用对,扩展表达式需要用“egrep或者grep -E” 
		echo -e  "\033[41;37m your input number not in (0,100),please retry..\033[0m"
		continue
	fi
	randnum=$(($(($RANDOM%100))+1))
	echo -ne  "\033[31m you input number is ${input} \033[0m"
	echo -e "\033[31m ,the random number is ${randnum} \033[0m"
	
	if (( ${randnum} < ${input} ));then
		echo -e "\033[31m your input number is bigger! \033[0m"
	elif (( ${randnum} > ${input}  ));then
		echo -e  "\033[31m your input number is smaller! \033[0m"
	else
		echo -e "\033[44;37m you guess currectly! \033[0m"
		break
	fi
done
echo "your are exiting..."
pstree -pa $$
sleep 5
echo "your are exited!"
#exit 0
