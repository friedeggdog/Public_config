sudo bash -c "echo 'alias genStudent=\"/path/genStudent.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias permit.sh=\"/path/permit.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias updateDefaulter=\"/path/updateDefaulter.sh\"' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"

sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' >> /home/HAD/.bashrc"
sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias feeBreakup=\"/path/feeBreakup.sh\"' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias signOut=\"/path/signOut.sh\"' | tee -a /home/*/*/*/.bashrc"

chmod o+x /path/genStudent.sh
chmod o+x /path/permit.sh
chmod g+x /path/updateDefaulter.sh
chmod +x /path/messAllocation.sh
chmod +x /path/feeBreakup.sh
chmod +x /path/signOut.sh

sudo bash -c "echo '/path/signOut.sh 2>/dev/null' | tee -a /home/*/*/*/.bashrc"

sudo bash -c "echo '/path/signOut.sh 2>/dev/null' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"