#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
if ! trap "echo 'you want exit,GOODBYE!'" SIGINT 
then
	 
	count=1
	while ((${count}<=10))
	do  
	echo "loop #${count}"
	sleep 1
	count=$[${count}+1]
	done
else
	exit
fi
