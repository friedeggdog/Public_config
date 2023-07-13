##INSTRUCTIONS
#RUN genStudent first then run setUp.sh


sudo bash -c "echo 'alias genStudent=\"/path/genStudent.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias permit.sh=\"/path/permit.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias updateDefaulter=\"/path/updateDefaulter.sh\"' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"

sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' >> /home/HAD/.bashrc"
sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias feeBreakup=\"/path/feeBreakup.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias signOut=\"/path/signOut.sh\"' | tee -a /home/*/*/*/.bashrc"

chmod 744 /path/genStudent.sh
chmod 744 /path/permit.sh
chmod 654 /path/updateDefaulter.sh
chmod 755 /path/messAllocation.sh
chmod 755 /path/feeBreakup.sh
chmod 755 /path/signOut.sh

chown :Warden /path/updateDefaulter.sh

sudo bash -c "echo '/path/signOut.sh 2>/dev/null' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo '/path/signOut.sh 2>/dev/null' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"