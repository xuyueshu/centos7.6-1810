#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
num=0
while ((${num} <=10))
do
	echo "the num is ${num} !"
	num=$[ ${num} + 1 ]
done
