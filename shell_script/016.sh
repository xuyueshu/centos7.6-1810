#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
TINGDUN=0.2
function print_jindu(){
	while :
	do
		count=$(($count+1))
		case ${count} in
		
		"1")
			echo  -e '-'"\b\c"
			sleep ${TINGDUN}
		;;	
		"2")
			echo  -e '\\'"\b\c"
			sleep ${TINGDUN}
		;;	
		"3")
			echo  -e "|\b\c"
			sleep ${TINGDUN}
		;;	
		"4")
			echo  -e "/\b\c"
			sleep ${TINGDUN}
			count=0	
		;;
		esac
	
	done
}
print_jindu
