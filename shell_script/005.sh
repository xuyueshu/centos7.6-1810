#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
disk_size=$(df -m /home | awk 'NR>1 {print $4}')
mem_size=$(free -m | awk '/Mem/ {print $4}')
if (( ${disk_size} <= 50000  )) && (( ${mem_size} <= 3000  ));then 
	echo " both  run out of memory and out of disk!"
fi
