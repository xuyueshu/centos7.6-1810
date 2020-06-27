#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
##用trap命令来捕获sigal信号，将sigal信号交由本地处理，阻止shell来处理该信号
#
trap " echo 'sorry,i have trapped CRIL-C' " SIGINT    ##捕获SIGINT 信号即‘ctrl-c’终止信号
#
count=1
while ((${count}<=10))
do
	echo "loop #${count}"
	((count++))
	sleep 1
done
##脚本执行时，通过键盘组合键发送信号来测试
