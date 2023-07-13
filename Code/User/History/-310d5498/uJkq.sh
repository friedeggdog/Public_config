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
        echo done
        line=($line) #converts str to array
        #echo ${line[@]} #Name RollNumber Hostel Room Mess MessPref
        useradd -m -d /root/home/${line[2]}/"00$((${line[3]}+1))"/${line[0]}/ -G Student "${line[0]}"
        touch /root/home/${line[2]}/"00$((${line[3]}+1))"/${line[0]}/userDetails.txt /root/home/${line[2]}/"00$((${line[3]}+1))"/${line[0]}/fees.txt
        echo ${line[@]} > /root/home/${line[2]}/"00$((${line[3]}+1))"/${line[0]}/userDetails.txt
        
    done < <(tail -n +2 $1)
    touch /root/home/GarnetA/announcements.txt /root/home/GarnetB/announcements.txt /root/home/Agate/announcements.txt /root/home/Opal/announcements.txt #can put * instead of hostel?
    touch /root/home/HAD/mess.txt /root/home/HAD/feeDefaulters.txt.
else
    echo file not exist
fi