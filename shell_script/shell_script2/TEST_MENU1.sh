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
function menu(){
	clear
	echo 
	echo -e "\t\t\tSystem Admin Menu"
	echo -e "\t1.Display disk space"
	echo -e "\t2.Display mem info"
	echo -e "\t3.Display logged user"
	echo "please input your option: "
	echo -e "\t0.Exit the program\n\n"
	read -n 1 option   ##-n表示只允许输入一个参数
}
while [ 1 ]
do
	menu
	case $option in
	"0")
		sleep 1
		break
		;;
	"1")
		sleep 1
		diskspace
		;;
	"2")
		sleep 1
		meminfo
		;;
	"3")
		sleep 1
		whoseon
		;;
	*)	
		sleep 1
		clear
		echo "Sorry,wrong selection!"
		;;
	esac
done	
clear

