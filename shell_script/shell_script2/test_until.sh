#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
var1=100
until (( ${var1} == 0  ))
do
	var1=$[${var1}-2]
	sleep 0.2
	echo -e  "\033[32m this var1 is ${var1}! \033[0m"
done
