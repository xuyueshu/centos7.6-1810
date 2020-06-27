#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
trap "echo 'sorry ,i have trapped CTRL-C'" SIGINT
count=1
while ((${count}<=10))
do
	echo "LOOP #${count}"
	((count++))
	sleep 1
done
trap - SIGINT ##移除trap,将信号交由shell处理
echo "i have remove trap.."

count=1
while ((${count}<=10))
do
	echo "LOOP #${count}"
	((count++))
	sleep 1
done
