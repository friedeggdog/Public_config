sudo bash -c "echo 'alias genStudent=\"/path/genStudent.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias permit.sh=\"/path/permit.sh\"' >> /home/HAD/.bashrc"

sudo bash -c "echo 'alias updateDefaulter=\"/path/updateDefaulter.sh\"' >> /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"

sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' >> /home/HAD/.bashrc"
sudo bash -c "echo 'alias messAllocation=\"/path/messAllocation.sh\"' >> /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias feeBreakup=\"/path/feeBreakup.sh\"' >> /home/*/*/*/.bashrc"

sudo bash -c "echo 'alias signOut=\"/path/signOut.sh\"' >> /home/*/*/*/.bashrc"

chmod +x /path/genStudent.sh
chmod +x /path/permit.sh
chmod +x /path/updateDefaulter.sh
chmod +x /path/messAllocation.sh
chmod +x /path/feeBreakup.sh
chmod +x /path/signOut.sh

sudo bash -c "echo '/home/jagannathanm/Documents/sysdelta/signOut.sh 2>/dev/null' >> /home/*/*/*/.bashrc"
sudo bash -c "echo '/home/jagannathanm/Documents/sysdelta/signOut.sh 2>/dev/null' >> /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"