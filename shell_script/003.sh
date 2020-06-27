#!/bin/bash
PATH=/home/youzhiqiang/perl5/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/youzhiqiang/.local/bin:/home/youzhiqiang/bin
export PATH
tar -czf log_$(date +"%Y%m%d").tar.gz /var/log
[ $? == "0" ] && echo "Backup successfully created!" || echo "backup faild!"
