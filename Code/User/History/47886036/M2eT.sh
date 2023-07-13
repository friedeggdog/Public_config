##INSTRUCTIONS
#RUN genStudent first then run setUp.sh then permit
#Make sure the paths are set properly the default is under the root directory but it can be changed
#genStudent takes in both arguments and runtime input
#permit takes nothing
#feeBreakup takes 4 arguments for Tutionfee Hostelrent Servicecharge and Messfee
#updateDefaulter takes nothing
#messAllocation takes via runtime input
#signOut takes in the date of leaving by argument


sudo bash -c "echo 'alias genStudent=\"/genStudent.sh\"' >> /etc/bash.bashrc"

sudo bash -c "echo 'alias permit=\"/permit.sh\"' >> /etc/bash.bashrc"

sudo bash -c "echo 'alias updateDefaulter=\"/updateDefaulter.sh\"' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"

sudo bash -c "echo 'alias messAllocation=\"/messAllocation.sh\"' >> /home/HAD/.bashrc"
sudo bash -c "echo 'alias messAllocation=\"/messAllocation.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias feeBreakup=\"/feeBreakup.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias signOut=\"/signOut.sh\"' | tee -a /home/*/*/*/.bashrc"

chmod 744 /genStudent.sh
chmod 744 /permit.sh
chmod 654 /updateDefaulter.sh
chmod 755 /messAllocation.sh
chmod 755 /feeBreakup.sh
chmod 755 /signOut.sh

chown :Warden /updateDefaulter.sh

if grep -qw "/signOut.sh 2>/dev/null" /etc/bash.bashrc
then 
    echo dummy 1>/dev/null
else 
    sudo bash -c "echo '/signOut.sh 2>/dev/null' | tee -a /etc/bash.bashrc"
fi
