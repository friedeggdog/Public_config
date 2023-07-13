#!/bin/bash

if [ -z $1 ]
then
    echo empty
fi

if date -d $1 &>/dev/null 
then
    echo "$USER $1 -" >> /home/HAD/leave.txt ##name dateofleave status(late/ontime)
elif [ -z $1 ]
then
else
    echo "Enter a valid leave date(YYYY-MM-DD) as a parameter"
fi 