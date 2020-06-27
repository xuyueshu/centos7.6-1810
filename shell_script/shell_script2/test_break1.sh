#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
#for ((a=1;a<4;a++))
#do
#	echo -e "\033[32m the outer loop :$a \033[0m"
#	for (( b=1;b<=100;b++ ))
#	do
#		echo -e "\033[34m       the outer loop :$b \033[0m"
#		if (( $b>=5  ))
#		then
#			break	
#		fi
#	done
#done
for ((a=1;a<4;a++))
do
	echo -e "\033[32m the outer loop :$a \033[0m"
	for (( b=1;b<=100;b++ ))
	do
		echo -e "\033[34m       the outer loop :$b \033[0m"
		if (( $b>=5  ))
		then
			break 2	
		fi
	done
done
