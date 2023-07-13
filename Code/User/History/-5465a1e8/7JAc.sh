chown GarnetB:GarnetB /home/GarnetB/*
chown GarnetA:GarnetA /home/GarnetA/*
chown Agate:Agate /home/Agate/*
chown Opal:Opal /home/Opal/*
chown -R :GarnetB /home/GarnetB/*
chown -R :GarnetA /home/GarnetA/*
chown -R :Agate /home/Agate/*
chown -R :Opal /home/Opal/*



#for hostel in GarnetA GarnetB Agate Opal
#do
#    chown -R :$hostel /home/$hostel/*
#    chown $hostel: /home/$hostel/*
#done

chmod 664 /home/*/*/*/*.txt
find /home/*/*  -regextype sed -regex ".*/[0-9][0-9]*" -exec chmod 770 {} +

sudo usermod -a -G GarnetA HAD
sudo usermod -a -G GarnetB HAD
sudo usermod -a -G Agate HAD
sudo usermod -a -G Opal HAD