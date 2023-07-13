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
        line=($line) #converts str to array
        #echo ${line[@]} #Name RollNumber Hostel Room Mess MessPref
        useradd -m -d /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/ -G Student "${line[0]}"
        touch /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/fees.txt #roomnumber is 0 or from 1
        echo ${line[@]} > /home/${line[2]}/"$((${line[3]}+1))"/${line[0]}/userDetails.txt
        
    done < <(tail -n +2 $1)
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

touch /home/{GarnetA,GarnetB,Agate,Opal}/announcements.txt 
touch /home/{GarnetA,GarnetB,Agate,Opal}/feeDefaulters.txt
touch /home/HAD/mess.txt

touch /home/HAD/leave.txt #for superusermode
sudo bash -c "echo '/home/jagannathanm/Documents/sysdelta/signOut.sh 2>/dev/null' >> /etc/bash.bashrc" #use properpath