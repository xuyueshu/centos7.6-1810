#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
##测试全局变量和局部变量，使用local声明局部变量，shell中所有的变量默认为全局变量
function func_local(){
	 temp=$[$value + 5]
	 local value=$[$temp * 5]
}
function func_overall(){
	 temp=$[$value + 5]
	 value=$[$temp * 5]
}
temp=4
value=6
read -p "please input test model like 'local' or 'overall':  " input
case $input in 
"local")
	echo -e "\033[32m 你选择的是测试局部变量! \033[0m"
	func_local
	;;
"overall")
	echo -e "\033[32m 你选择的是测试全局变量! \033[0m"
	func_overall
	;;
*)
	echo "USAGE : $0 <local> or <overall>"
esac

echo "'测试结果为':$value "
