#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
source ./check_file_exists.sh
check_file_exists standerror1.txt
echo "this is error output!" >&2 ## '&2' 表示当做标准错误输出，&后面带上输出文件描述符，表示重定向到该输出文件
echo "this is stand output!"
###测试  sh test_STDOUT_STDERR_2.sh  2>standerror1.txt
