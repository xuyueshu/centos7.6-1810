#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
function print_jindu(){
	while :
	do
		echo -n "#"
		sleep 0.1
	done
}
print_jindu &  ##后台执行
tar -czf log_$(date +"%Y%m%d").tar.gz /var/log
#killall $! ##杀掉守护进程
#pstree -p | grep ssh
#kill -9 $$
kill -9 $!
