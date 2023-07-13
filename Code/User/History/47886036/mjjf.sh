##INSTRUCTIONS
#RUN genStudent first then run setUp.sh then permit
#Make sure the paths are set properly the default is under the /usr/local/bin/ directory but it can be changed
#genStudent takes in both arguments and runtime input
#permit takes nothing
#feeBreakup takes 4 arguments for Tutionfee Hostelrent Servicecharge and Messfee
#updateDefaulter takes nothing
#messAllocation takes via runtime input
#signOut takes in the date of leaving by argument


bash -c "echo 'alias genStudent=\"/usr/local/bin/genStudent.sh\"' >> /etc/bash.bashrc" #add sudo where there is a bash if required

bash -c "echo 'alias permit=\"/usr/local/bin/permit.sh\"' >> /etc/bash.bashrc"

bash -c "echo 'alias updateDefaulter=\"/usr/local/bin/updateDefaulter.sh\"' | tee -a /home/{Opal,GarnetA,GarnetB,Agate}/.bashrc"

bash -c "echo 'alias messAllocation=\"/usr/local/bin/messAllocation.sh\"' >> /home/HAD/.bashrc"
bash -c "echo 'alias messAllocation=\"/usr/local/bin/messAllocation.sh\"' | tee -a /home/*/*/*/.bashrc"

bash -c "echo 'alias feeBreakup=\"/usr/local/bin/feeBreakup.sh\"' | tee -a /home/*/*/*/.bashrc"

bash -c "echo 'alias signOut=\"/usr/local/bin/signOut.sh\"' | tee -a /home/*/*/*/.bashrc"

chmod 744 /usr/local/bin/genStudent.sh
chmod 744 /usr/local/bin/permit.sh
chmod 654 /usr/local/bin/updateDefaulter.sh
chmod 755 /usr/local/bin/messAllocation.sh
chmod 755 /usr/local/bin/feeBreakup.sh
chmod 755 /usr/local/bin/signOut.sh

chown :Warden /usr/local/bin/updateDefaulter.sh

if grep -qw "/usr/local/bin/signOut.sh 2>/dev/null" /etc/bash.bashrc
then 
    echo dummy 1>/dev/null
else 
    bash -c "echo '/usr/local/bin/signOut.sh 2>/dev/null' | tee -a /etc/bash.bashrc"
fi
