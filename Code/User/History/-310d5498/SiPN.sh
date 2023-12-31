#!/bin/bash

if [ -f "$1" ]
then
    sudo groupadd Warden
    sudo groupadd Student
    sudo useradd -m HAD
    sudo useradd -m -G Warden GarnetA
    sudo useradd -m -G Warden GarnetB
    sudo useradd -m -G Warden Agate
    sudo useradd -m -G Warden Opal
    while IFS= read -r line
    do
        line=($line) 
        #echo ${line[@]} #Name RollNumber Hostel Room Mess MessPref Month Year Dept
        roll=${line[1]}
        dept=${line[1]:1:2}
        useradd -m -d /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/ -G Student "${line[0]}"
        touch /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/fees.txt
        echo ${line[@]} - 20${roll:4:2} $dept > /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt
        
    done < <(tail -n +2 $1)
else
    echo File not given using input mode
fi


a=1
if [ -z "$1" ]
then
    sudo groupadd Warden
    sudo groupadd Student
    sudo useradd -m HAD
    sudo useradd -m -G Warden GarnetA
    sudo useradd -m -G Warden GarnetB
    sudo useradd -m -G Warden Agate
    sudo useradd -m -G Warden Opal
    while [ $a -eq 1 ]
    do
        read -p "Enter Name:" name
        read -p "Enter Roll:" roll
        read -p "Enter Hostel:" hostel
        read -p "Enter Room:" room
        read -p "Enter Current Mess:" mess

        useradd -m -d /home/$hostel/$room/$name/ -G Student "$name"
        touch /home/$hostel/$room/$name/userDetails.txt /home/$hostel/$room/$name/fees.txt
        echo $name $roll $hostel $room $mess - - 20${roll:4:2} $dept > /home/$hostel/$room/$name/userDetails.txt
        read -p "Enter 1 to keep going:" a 
    done
fi

touch /home/{GarnetA,GarnetB,Agate,Opal}/announcements.txt 
touch /home/{GarnetA,GarnetB,Agate,Opal}/feeDefaulters.txt

touch /home/HAD/mess.txt
echo "Mess capacity
1 35
2 35
3 35
Student Preferences" > /home/HAD/mess.txt

touch /home/HAD/leave.txt #for superusermode
