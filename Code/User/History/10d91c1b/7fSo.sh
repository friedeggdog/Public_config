#!/bin/bash

if id -nG "$USER" | grep -qw "Student"
then 
    if [ $(cat ~/userDetails.txt | awk '{print $6}') -eq '-']
    then
        if [ $(( m1+m2+m3 )) -eq 6 -a $(( m1*m2*m3 )) -eq 6 ]
        then
            echo Enter the mess preference order seperated by spaces
            read m1 m2 m3
            echo $(awk -v m1="$m1" -v m2="$m2" -v m3="$m3" '{if (NR==1) $6=m1 m2 m3; print $0}' ~/userDetails.txt) > ~/userDetails.txt
            echo $(cat ~/userDetails.txt | awk '{print $2}') >> /home/HAD/mess.txt
        else
            echo Invalid messes entered
        fi
    else
        echo Mess already allocated
    fi
elif id -nG "$USER" | grep -qw "HAD"
then 
    
else
    echo Not a member of either of the required groups
fi