#!/bin/bash

if date -d $1 &>/dev/null 
then
    echo "$USER $1 -" >> /home/jagannathanm/leave.txt #name dateofleave status(late/ontime) ##
elif [ -z $1 ]
then
    lineno=$(grep -n -e "^$USER.*-$" /home/jagannathanm/leave.txt | cut -f1 -d:)
    line=($(grep -n -e "^$USER.*-$" /home/jagannathanm/leave.txt))

    echo ${line[@]}
    echo ${line[1]}
    currentdate=$(date -d $(date +"%Y-%m-%d") +%s) #interexp evals to YYYY-MM-DD and then to seconds
    linedate=$(date -d ${line[1]} +%s)

    echo $currentdate $linedate
    if [ $currentdate -gt $linedate ]
    then
        echo $currentdate $linedate
        echo "$(awk -v lineno=$lineno '{if (NR==4){print $1, $2, "LATE" } else {print $0}}' /home/jagannathanm/leave.txt)" > /home/jagannathanm/leave.txt ##
    else
        echo "$(awk -v lineno=$lineno '{if (NR==4){print $1, $2, "ONTIME" } else {print $0}}' /home/jagannathanm/leave.txt)" > /home/jagannathanm/leave.txt ##
    fi
else
    echo "Enter a valid leave date(YYYY-MM-DD) as a parameter"
fi 