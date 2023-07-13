#!/bin/bash

#chown GarnetB:GarnetB /home/GarnetB/*
#chown GarnetA:GarnetA /home/GarnetA/*
#chown Agate:Agate /home/Agate/*
#chown Opal:Opal /home/Opal/*
#chown -R :GarnetB /home/GarnetB/*
#chown -R :GarnetA /home/GarnetA/*
#chown -R :Agate /home/Agate/*
#chown -R :Opal /home/Opal/*

#can students cd

for hostel in GarnetA GarnetB Agate Opal
do
    chown -R :$hostel /home/$hostel/*  #makes all under the hostel owned by group 
    chown $hostel: /home/$hostel/*     #makes just the layerunder the $hostel owned by hostel
    chmod 771 /home/$hostel/           #makes the hostel cd able by HAD
    chmod 770 /home/$hostel/*/*/       #makes the student folder cd able by warden/HAD
    sudo usermod -a -G $hostel HAD     #add the had to the warden groups

    for path in $(find /home/$hostel/*/* -maxdepth 0 -regextype sed -regex ".*/[A-Z][a-z]*")
    do 
        ln -s /home/$hostel/announcements.txt $path/announcments
        ln -s /home/$hostel/feeDefaulters.txt $path/feeDefaulters
        ln -s /home/HAD/mess.txt $path/mess ###
    done

done

chmod +x HAD/
chmod 666 /home/*/*/*/userDetails.txt
find /home/*/*  -regextype sed -regex ".*/[0-9][0-9]*" -exec chmod 771 {} + #maybe 750/770
chmod o+w /home/HAD/mess.txt
chmod 666 /home/*/*/*/fees.txt
chmod 666 /home/HAD/leave.txt #for superusermode
