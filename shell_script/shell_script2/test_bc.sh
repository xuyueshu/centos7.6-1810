#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
var1=10.36
var2=43.67
var3=33.2
var4=71
var5=$(bc << EOF
scale=4
a1=${var1} * ${var2}
a2=${var3}+${var4}
a1+a2
EOF
)
echo ${var5}
