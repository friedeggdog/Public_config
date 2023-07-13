#!/bin/bash

if [ -e $1 ]
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
        line=($line) #converts str to array
        #echo ${line[@]} #Name RollNumber Hostel Room Mess MessPref
        useradd -m -d /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/ -G Student "${line[0]}"
        touch /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/fees.txt #roomnumber is 0 or from 1
        echo ${line[@]} > /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt
        
    done < <(tail -n +2 $1)
    #touch /home/GarnetA/announcements.txt /home/GarnetB/announcements.txt /home/Agate/announcements.txt /home/Opal/announcements.txt 
    #touch /home/GarnetA/feeDefaulters.txt /home/GarnetB/feeDefaulters.txt /home/Agate/feeDefaulters.txt /home/Opal/feeDefaulters.txt
else
    echo file not exist
fi


a=1
if [ -z $1 ]
then
    while [ a -eq 1 ]
    do
        sudo groupadd Warden
        sudo groupadd Student
        sudo useradd -m HAD
        sudo useradd -m -G Warden GarnetA
        sudo useradd -m -G Warden GarnetB
        sudo useradd -m -G Warden Agate
        sudo useradd -m -G Warden Opal

        read -p "Enter Name:" name
        read -p "Enter Roll:" roll
        read -p "Enter Hostel:" hostel
        read -p "Enter Room:" room
        read -p "Enter Current Mess:" mess

        useradd -m -d /home/$hostel/$room/$name/ -G Student "$name"
        touch /home/$hostel/$room/$name/userDetails.txt /home/$hostel/$room/$name/fees.txt
        echo $name $roll $hostel $room $mess - > /home/$hostel/$room/$name/userDetails.txt
        read -p "Enter 1 to keep going:" a 
    done
fi

find /home/* -maxdepth 0 -type d -exec echo {}/announcements.txt \; ##test
find /home/* -maxdepth 0 -type d -exec echo {}/feeDefaulters.txt \;
touch /home/HAD/mess.txt
touch /home/HAD/leave.txt #for superusermode
echo /home/jagannathanm/Documents/sysdelta/signOut.sh >> /etc/bash.bashrc