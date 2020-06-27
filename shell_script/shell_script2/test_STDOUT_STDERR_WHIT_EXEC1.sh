#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
####永久重定向2
BASE_DIR=$(dirname $0)
source ${BASE_DIR}/check_file_exists.sh
check_file_exists ${0}_standarderror.txt  ${0}_standardoutput.txt 
exec 2>${0}_standarderror.txt ##将标准错误输出重定向到standarderror.txt
echo "this is the start of the script..."
echo "now redirecting all output to another file.."
exec 1>${0}_standardoutput.txt
echo "this output should go to the output file:${0}_standardoutput.txt"
echo "but the this error should go to the ${0}_standarderror.txt" >&2 ##重定向错误文件_standarderror.txt
