#!/bin/bash

if id -nG "$USER" | grep -qw "Warden"
then
    echo The defaulters are: > ~/feeDefaulters.txt
    echo The first 5 people who payed are: > ~/announcements.txt

    files=$(ls -ltr --time-style=long-iso ~/*/*/fees.txt | awk '{print $8}')
    for i in $files
    do 
        studpath=${i:0:-8}userDetails.txt
        if [ $(cat $i | awk '{ sum+=$2} END {print sum}') -eq 50000 ] 
        then 
            if [ $( wc -l < ~/announcements.txt ) -le 5 ]
            then
                cat $studpath | awk '{print $2}' >> ~/announcements.txt
            fi
        else
            cat $studpath | awk '{print $1,$2}' >> ~/feeDefaulters.txt
        fi
    done

else
    echo $USER does not belong to Warden
fi