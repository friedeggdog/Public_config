#!/bin/bash
#add dev/null to the alias also
if date -d $1 &>/dev/null 
then
    echo "$USER $1 -" >> /home/HAD/leave.txt #name dateofleave status(late/ontime) 
elif [ -z $1 ]
then
    lineno=$(grep -n -e "^$USER.*-$" /home/HAD/leave.txt | cut -f1 -d:)
    line=($(grep -n -e "^$USER.*-$" /home/HAD/leave.txt))

    currentdate=$(date -d $(date +"%Y-%m-%d") +%s) #interexp evals to YYYY-MM-DD and then to seconds
    linedate=$(date -d ${line[1]} +%s)

    if [ $currentdate -gt $linedate ]
    then
        echo "$(awk -v lineno=$lineno '{if (NR==lineno){print $1, $2, "LATE" } else {print $0}}' /home/HAD/leave.txt)" > /home/HAD/leave.txt 
    else
        echo "$(awk -v lineno=$lineno '{if (NR==lineno){print $1, $2, "ONTIME" } else {print $0}}' /home/HAD/leave.txt)" > /home/HAD/leave.txt 
    fi
else
    echo "Enter a valid leave date(YYYY-MM-DD) as a parameter"
fi 