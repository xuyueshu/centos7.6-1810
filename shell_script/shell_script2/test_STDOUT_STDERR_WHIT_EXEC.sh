#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
BASE_DIR=$(dirname $0)
##永久重定向
source $BASE_DIR/check_file_exists.sh 
check_file_exists all_output.txt
exec 1>all_output.txt ## exec 会开启一个子shell 去执行此重定向
echo "this is a test of redirecting all output"
echo "from a script  to another file"
echo "without having to redirect every individual line"
