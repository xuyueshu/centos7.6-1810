#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

##清空界面，显示硬盘信息
function diskspace(){
	clear
	df -k
	sleep 2
}
##显示登陆用户信息
function whoseon(){
	clear
	who
	sleep 2
}
##显示内存信息
function meminfo(){
	clear
	cat /proc/meminfo
	sleep 2
}
PS3="Enter the option: "  ##select 命令会会将每个列表选项显示成一个带编号的选项，然后为选项显示一个由ps3环境变量定义的特殊提示符。
select option in "Display disk space" "Display mem info" \
"Display logged user" "Exit Program"  ###选项列表使用空格隔开
do
	case $option in
	"Display disk space")
		sleep 1
		diskspace
		;;
	"Display mem info")	
		sleep 1
		meminfo		
		;;
	"Display logged user")
		sleep 1
		whoseon
		;;
	"Exit Program")
		sleep 1
		break
		;;
	*)
		echo "Sorry,wrong input!"
	esac		

done
