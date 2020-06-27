#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
for file in /etc/*
do
	if [ -d ${file} ]
	then 
		echo -e  "\033[32m  ${file} is a directory!  \033[0m"
	elif [ -f ${file} ]
	then 
		echo -e  "\033[34m  ${file} is a file!  \033[0m"
	fi
done
