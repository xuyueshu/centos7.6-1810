#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
echo -e "your input numbers are :$@"
num1=$1
num2=$2
num3=$3
cachenum=0
for num in ${num1} ${num2} ${num3}
do
	! echo "${num}" | grep '^[1-9][0-9]*$' && echo -e "\033[31m your input num ${num} is invalid! \033[0m " &&  exit 1
done
if (( ${num1} > ${num2} ));then
	cachenum=${num1}
	num1=${num2}
	num2=${cachenum}
fi

	echo "first compare: ${num1} ${num2} ${num3}"
if (( ${num1} > ${num3} ));then
		cachenum=${num1}
		num1=${num3}
		num3=${cachenum}
fi
	echo "second compare: ${num1} ${num2} ${num3}"
if (( ${num2} > ${num3} ));then
		cachenum=${num2}
		num2=${num3}
		num3=${cachenum}
fi
echo "third compare: ${num1} ${num2} ${num3}"
echo "your numbers from small to big are : ${num1} ${num2} ${num3}"
