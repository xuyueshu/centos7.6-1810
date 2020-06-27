#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
mypath=$(echo $PATH | sed 's/:/ /g')
for directory in $mypath
do
	item=$(sudo ls $directory)
	count=0
	for it in $item
	do
		count=$[$count+1]	
	done
		echo -e "$directory \t $count"
done
