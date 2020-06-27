#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
if [[ $USER == y*  ]]      #双方括号中使用模式匹配
then
	echo -e "\033[31m your account is ${USER}  \033[0m"	
else 
	echo -e "\033[32m sorry i don't kown you! \033[0m"
fi
