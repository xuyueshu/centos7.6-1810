#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
##测试数组
function double_array(){
	local origenal_array
	local new_array
	local length
	local i
	origenal_array=($(echo "$@"))
	new_array=($(echo "$@"))
	length=$[$# -1]
	for ((i=0;i<=${length};i++ ))
	do
		new_array[$i]=$[ ${origenal_array[$i]} * 2 ]
	done
		echo ${new_array[*]} ##使用echo将方法执行结果返回
}
my_array=(1 2 3 4 5)
new_array=($(double_array ${my_array[*]}))  ##数组使用() 括起来的
echo "the origenal array is :   ${my_array[*]}"
echo "the new array is :  ${new_array[*]}"
