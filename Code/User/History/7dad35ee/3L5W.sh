if id -nG "$USER" | grep -qw "Warden"
then
    files=$(ls -ltr --time-style=long-iso ~/*/*/fees.txt | awk '{print $8}')
    for i in $files
    do 
        if [ $(cat $i | awk '{ sum+=$2} END {print sum}') -eq 50000 ] 
        then 
            if [ $( wc -l < ~/announcements.txt ) -le 5 ]
            then
                echo temp >> ~/announcements.txt
            fi
        else
            echo defaultertemp >> ~/feeDefaulters.txt
        fi
    done

else
    echo $USER does not belong to Warden
fi