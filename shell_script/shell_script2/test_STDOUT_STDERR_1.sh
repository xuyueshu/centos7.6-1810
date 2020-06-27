#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

function check_file_exists(){
  for file in $@
  do
	if [ -f ${file}  ];then
		echo -e "\033[31m ${file} is exists  \033[0m"
		rm -f ${file}
		echo -e "\033[32m ${file} is exists  \033[0m"
	fi
  done
}
check_file_exists standout.txt standerror.txt
ls -al for_list2.sh for_list3.sh for_list7.sh for_list8.sh 1>standout.txt 2>standerror.txt ##将标准输出和标准错误输出分别重定向
check_file_exists standout_and_standerror.txt
ls -al for_list2.sh for_list3.sh for_list7.sh for_list8.sh &>standout_and_standerror.txt ## ‘&>’表示将标准输出及标准错误输出同时重定向同一个文件


