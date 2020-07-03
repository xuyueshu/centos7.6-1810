#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
##################################################
## this is a shell script to delete users you want
##################################################

#-------------define functions-------------------
##获取回答
function get_answer(){
unset ANSWER
ASK_COUNT=0
while [ -z $ANSWER  ]
do
	ASK_COUNT=$[ $ASK_COUNT +1 ]
	case $ASK_COUNT in 
	2)
		echo "Please answer the question."
		;;
	3)
		echo "One last try....,please answer the question."
		;;
	4)
		echo "Since you refuse to answer the question ..."
		echo "exiting program"
		echo
		exit
		;;
	esac		

	if [ -n $LINE2  ]
	then
		echo $LINE1
		echo $LINE2
	else
		echo $LINE1
	fi

	read -t 10 ANSWER
done

unset LINE1
unset LINE2
}
##审核回答
function process_answer(){
case $ANSWER in
y|Y|YES|Yes|YEs|YeS|yES|yEs|yeS|yes)
	;;
*)
	echo
	echo $EXIT_LINE1
	echo $EXIT_LINE2
	exit
	;;
esac
unset EXIT_LINE1
unset EXIT_LINE2
}

#--------------main script----------------------
echo "STEP1:  determine USER ACCOUNT NAME to delete."
LINE1="please enter the user name of the user"
LINE2="you wish to delete from your system: "
get_answer
USER_ACCONT=$ANSWER

LINE1="Is $USER_ACCONT the user account"
LINE2="you wish to delete? [y|n]"
get_answer
EXIT_LINE1="Because the acount $USER_ACCONT is not "
EXIT_LINE2="you wish to delete,leaving the script..."
process_answer

##确认系统中是否存在改用户
USER_ACCOUNT_RECORD=$(cat /etc/passwd |grep -w $USER_ACCONT)
if [ $? -eq 1 ]
then
	echo "Account,$USER_ACCONT is not found.."
	echo "leaving the script"
	exit
fi
echo 
echo "i find the record :"
echo $USER_ACCOUNT_RECORD
LINE1="Is the account $USER_ACCONT you wish to delete?[y|n]"
get_answer
EXIT_LINE1="Because the acount $USER_ACCONT is not"
EXIT_LINE2="you wish to delete,leaving the script..."
process_answer

##查看该用户是否还有没有停止的程序仍然在执行
echo
echo "STEP2: Find process on system that belongs to the $USER_ACCONT is running.."
echo
ps -u $USER_ACCONT >/dev/null

case $? in
1)
	echo "there is no process which belongs to $USER_ACCONT is running."
	;;
0)
	echo "$USER_ACCONT has the following process running: "
	echo
	ps -u $USER_ACCONT  ##此处的ps命令颜色不一样，表示为外部命令，会启动子进程
	LINE1="Would you like me to kill the process(es)?[y|n]"
	get_answer
	
	case $ANSWER in
	y|Y|YES|Yes|YEs|YeS|yES|yEs|yeS|yes)
		echo
		echo "killing the process(es)..."
		COMMAND1="ps -u $USER_ACCONT --no-heading"
		COMMAND3="xargs -d \\n /usr/bin/sudo /bin/kill -9"
		$COMMAND1 | awk '{print $1}' | $COMMAND3 ####此处的awk命令颜色不一样，表示为外部命令，会启动子进程
		echo 
		echo "killed the process(es)!"
		;;
	*)
		echo 
		echo "will not kill the process."
		echo
		;;
	esac
	;;
	
esac



