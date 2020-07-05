#!/bin/bash
echo
echo "The script begin run...."
sleep 2
CURRENT_USER=$(whoami)
if [ "$CURRENT_USER" != "root" ];then
	echo -e "\033[31m the current user is $CURRENT_USER,please use root to run this script! \033[0m"
	echo
	echo "leaving script..."
	exit 1
fi
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
PACKAGE_DIR=/home/installpackage/mysql
file1=mysql-community-common-5.7.13-1.el6.x86_64.rpm
file2=mysql-community-libs-5.7.13-1.el6.x86_64.rpm
file3=mysql-community-client-5.7.13-1.el6.x86_64.rpm
file4=mysql-community-server-5.7.13-1.el6.x86_64.rpm
for i in file1 file2 file3 file4
do
	if [ -f "${PACKAGE_DIR}/${i}" ];then
		echo "${i} is not exists,ready to exit....." && exit 1
	fi
done
systemctl status mysqld.service >/dev/null
if [ $? -eq 0 ]
then	
	echo 
	echo -e "\033[31m \t\t This is a mysql is running.. \033[0m"
	echo -e "\033[32m \t\t Do you want stop it and remove it?[Y|N]:  \033[0m"
	read -t 10 ANSWER
	case $ANSWER in
	Y|y|Yes|YEs|YES|yes|yEs|yeS|yES)
		
		;;
	*)
		echo
		echo "you chose 'no',we leaving the script..."
		echo "exit."
		exit
		;;
	esac
	systemctl stop mysqld.service
fi 
echo $(rpm -qa | grep mariadb 2>/dev/null) | xargs -n 1  rpm -e --nodeps
echo $(rpm -qa | grep mysql 2>/dev/null) | xargs -n 1  rpm -e --nodeps
[ "#?" -eq 0 ] && echo -e "\033[32m \t\t\t Remove the existed mysql successfully! \033[0m"
cd ${PACKAGE_DIR}
echo
echo -e "\033[32m Now install mysql.... \033[0m"
sleep 1
 rpm -ivh ${file1} --nodeps --force &&   rpm -ivh ${file2}  &&  rpm -ivh ${file3} &&  rpm -ivh ${file4} || echo "install failed !!"
TEMP_PASSWORD=$(awk '/temporary password/{print $NF}' /var/log/mysqld.log)
LOGIN_PASSWORD="root@123"
#sed -i  '/^\[mysqld\]$/a skip-grant-tables' /etc/my.cnf  ##不指定行号，使用正则匹配
/etc/init.d/mysqld start

if ! which expect
then
	echo "Current system is not expect service,now install expect,wait a minute..."
	sleep 2
	yum install expect -y	
fi

/usr/bin/expect<<EOF
spawn mysql -u root -p
expect "*:*"
send "${TEMP_PASSWORD};\r"
expect "*>*"
send "set global validate_password_policy=0;\r"
expect "*>*"
send "set global validate_password_length=1;\r"
expect "*>*"
send "set password=password('${LOGIN_PASSWORD}');\r"
expect "*>*"
send "grant all on *.* to 'root'@'%' identified by '${LOGIN_PASSWORD}' with grant option ;\r"
expect "*>*"
send "flush privileges;\r"
expect "*>*"
send "quit;\r"
EOF
#sed -i '/^skip-grant-tables$/d' /etc/my.cnf
systemctl restart mysqld.service ##不指定行号，使用正则匹配
mysql -uroot -p${LOGIN_PASSWORD} -e "show databases;"
[ "$?" == "0"  ] && echo  -e "\033[32m mysql installed successfully!\033[0m" || echo -e "\033[31m mysql install failed!\033[0m"


