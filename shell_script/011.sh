#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
total_upnum=0
total_downnum=0
ip_up=()
ip_down=()
for ip in $(seq 1 254) 
do
	ping -c2 -i 0.3 -W1 192.168.0.${ip} >/dev/null
	if [ "$?" == "0" ];then
		echo -e "\033[32m 192.168.0.${ip} is up! \033[0m"
		#((total_upnum++))
		ip_up[${#ip_up[*]}]=192.168.0.${ip}	
	else
		echo -e "\033[31m 192.168.0.${ip} is down! \033[0m"
		#((total_downnum++))
		ip_down[${#ip_down[*]}]=192.168.0.${ip}	
	fi
done 
#echo -n  "could connected ip total:${total_upnum}"
#echo "could not  connected ip total:${total_upnum}"
echo "could connected ips are:${ip_up[*]}"
echo "could not  connected ips are:${ip_down[*]}"
echo -n  "could connected ip total:${#ip_up[*]}"
echo ",could not  connected ip total:${#ip_down[*]}"
