#!/bin/bash
#add dev/null to the alias also


if date -d $1 &>/dev/null 
then
    hostel=$(awk '{print $3}' ~/userDetails.txt)
    echo "$USER $hostel $1 -" >> /home/jagannathanm/leave.txt #name hostel dateofleave status(late/ontime/yes) 
elif [ -z $1 ]
then
    if id -nG "$USER" | grep -qw "Student"
    then
        lineno=$(grep -n -e "^$USER.*-$" /home/jagannathanm/leave.txt | cut -f1 -d:)
        line=($(grep -n -e "^$USER.*-$" /home/jagannathanm/leave.txt))
        currentdate=$(date -d $(date +"%Y-%m-%d") +%s) #innerexp evals to YYYY-MM-DD and then to seconds
        linedate=$(date -d ${line[1]} +%s)

        if [ $currentdate -gt $linedate ]
        then
            echo "$(awk -v lineno=$lineno '{if (NR==lineno){print $1, $2, $3, "LATE" } else {print $0}}' /home/jagannathanm/leave.txt)" > /home/jagannathanm/leave.txt 
        else
            echo "$(awk -v lineno=$lineno '{if (NR==lineno){print $1, $2, $3, "ONTIME" } else {print $0}}' /home/jagannathanm/leave.txt)" > /home/jagannathanm/leave.txt 
        fi
    elif id -nG "$USER" | grep -qw "jagannathanm"
    then
        echo WOrking
        while read i 
        do
            line=($i)
            lineno=$(echo ${line[@]} | cut -f1 -d:)
            echo ${line[@]}
            echo $lineno

            #echo "Allow ${line[@]} to go on leave? Enter y for yes anything for no:"
            #read confirm
            #echo "$(awk -v lineno=$lineno -v confirm=$confirm '{if (NR==lineno){print $1, $2, $3, confirm } else {print $0}}' /home/jagannathanm/leave.txt)" > /home/jagannathanm/leave.txt
        done < <(grep -n -e "^.*$USER.*-$" /home/jagannathanm/leave.txt)
    else
        echo Not a member of the right group
    fi
else
    echo "Enter a valid leave date(YYYY-MM-DD) as a parameter"
fi
