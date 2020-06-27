#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
trap "echo 'you want exit,GOODBYE!'" EXIT ##捕获exit退出信号，并打印设定的退出信息
count=1
while ((${count}<=10))
do  
	echo "loop #${count}"
	sleep 1
	count=$[${count}+1]
done

