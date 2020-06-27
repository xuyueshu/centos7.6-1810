#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
for i in $(seq 9)
do
	for j in $(seq $i)
	do
		echo -n  "${j}*${i}=$((${j}*${i}))  "
		#echo -e "\\t"
	done
		echo -e "\n"		
done

