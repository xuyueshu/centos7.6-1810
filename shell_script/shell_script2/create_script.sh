#!/bin/bash
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/java/jdk1.8.0_181/bin:/home/youzhiqiang/bin
[ "$#" -eq "0" ] && echo -e  "\033[31m USAGE:$0 <name1> <name..> \033[0m" && exit 1
BASE_DIR=$(dirname $0)
for i in $@
do 
	i=$(echo $i | tr '[a-z]' '[A-Z]')
	filename=${BASE_DIR}/${i}.sh
	if [ -f "${filename}"  ];then
		echo -e  "\033[40;31m ${filename} is existed,please check your input! \033[0m"
		exit 1
	fi
cat>${filename} <<EOF
#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
EOF
	chmod u+x ${filename} && echo -e "\033[32m ${filename} created successfully! \033[0m"
done
