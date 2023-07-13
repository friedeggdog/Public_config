if id -nG "$USER" | grep -qw "Warden"
then
    files=$(ls -ltr --time-style=long-iso ~/*/*/fees.txt | awk '{print $8}') 

else
    echo $USER does not belong to Warden
fi