#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
count=1
while ((${count}<=100))
do
	echo "LOOP #${count}"
	((count++))
	sleep 3
done
