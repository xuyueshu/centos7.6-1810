#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
TMP_IFS=$IFS
IFS="\\n"
for i in $(cat /etc/passwd)
do
	echo -e "\033[32m ${i} \033[0m"
	IFS=":"	
	for j in $i
	do
		echo "     $j"
	done
	
done
IFS=${TMP_IFS}
