#chown GarnetB:GarnetB /home/GarnetB/*
#chown GarnetA:GarnetA /home/GarnetA/*
#chown Agate:Agate /home/Agate/*
#chown Opal:Opal /home/Opal/*
#chown -R :GarnetB /home/GarnetB/*
#chown -R :GarnetA /home/GarnetA/*
#chown -R :Agate /home/Agate/*
#chown -R :Opal /home/Opal/*

for hostel in GarnetA GarnetB Agate Opal
do
    chown -R :$hostel /home/$hostel/*  #makes all under the hostel owned by group 
    chown $hostel: /home/$hostel/*     #makes just the layerunder the $hostel owned by hostel
    chmod 771 /home/$hostel/           #makes the hostel cd able by HAD
    chmod 770 /home/$hostel/*/*/        #makes the student folder cd able by warden/HAD
done

chmod 664 /home/*/*/*/*.txt
find /home/*/*  -regextype sed -regex ".*/[0-9][0-9]*" -exec chmod 771 {} + #maybe 750/770

sudo usermod -a -G GarnetA HAD
sudo usermod -a -G GarnetB HAD
sudo usermod -a -G Agate HAD
sudo usermod -a -G Opal HAD