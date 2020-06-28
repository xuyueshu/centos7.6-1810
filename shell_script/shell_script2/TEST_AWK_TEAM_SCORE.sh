#!/bin/bash
export PATH=/root/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
cat >${0}.score.txt <<EOF
Rich Blum,team1,100,115,95
Barbara Blum,team1,110,115,100
Christine Bresnahan,team2,120,115,118
Tim Bresnahan,team2,125,112,116
EOF
for team in $(awk -F,'{print $2}' | uniq)
do
	awk -v team=$team 'BEGIN{FS=","; total=0}
	{
		if($2==team){
			total+=$3+$4+$5
		}
	}
	END{
		avg=total/6
		print "Total for ",team,"is",total,",the average is",avg
	}
' ${0}.score.txt

done

