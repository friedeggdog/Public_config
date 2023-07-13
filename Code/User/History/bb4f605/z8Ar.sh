#!/bin/bash

if [ -f "$1" ]
then
    groupadd Sibling
    while IFS= read -r line
    do
        line=($line) 
        useradd -m -G Sibling "${line[0]}"
        touch /home/${line[0]}/website.txt
    done < <(cat $1)
else
    echo File not given using input mode
fi


a=1
if [ -z "$1" ]
then
    groupadd Sibling
    while [ $a -eq 1 ]
    do
        read -p "Enter Name:" name

        useradd -m -G Sibling "$name"
        touch /home/$name/website.txt
        read -p "Enter 1 to keep going:" a 
    done
fi

chmod 640 /*/*/website.txt
chown $USER:Sibling /*/*/website.txt

