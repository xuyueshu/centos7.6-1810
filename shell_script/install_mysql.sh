#!/bin/bash
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
echo $(rpm -qa | grep mariadb) | xargs -n 1  rpm -e --nodeps
echo $(rpm -qa | grep mysql) | xargs -n 1 rpm -e --nodeps
cd ${PACKAGE_DIR}
rpm -ivh ${file1} --nodeps --force && rpm -ivh ${file2}  && rpm -ivh ${file3} && rpm -ivh ${file4} || echo "install failed !!"
/etc/init.d/mysqld start
echo "mysqld first start successfully!"
/etc/init.d/mysqld stop
echo "mysqld first stop successfully!"
#mysqld_safe --user=mysql --skip-grant-tables &
#echo -e "\n"
sed -i  '/^\[mysqld\]$/a skip-grant-tables' /etc/my.cnf  ##不指定行号，使用正则匹配
/etc/init.d/mysqld start
/usr/bin/expect <<-EOF
spawn mysql -u root -p
expect "*:*"
send "\n;\r"
expect "*>*"
send "set password=password('root@1234');\r"
expect "*>*"
send "grant all on *.* to root@'%' identified by 'root@1234';\r"
expect "*>*"
send "flush privileges;\r"
expect "*>*"
send "quit;\r"
EOF
sed -i '/^skip-grant-tables$/d' /etc/my.cnf
systemctl restart mysqld.service ##不指定行号，使用正则匹配
mysql -uroot -proot@1234 -e "show databases;"
[ "$?" == "0"  ] && echo  -e "\033[32m mysql installed successfully!\033[0m" || echo -e "\033[31m mysql install failed!\033[0m"


