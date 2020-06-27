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
