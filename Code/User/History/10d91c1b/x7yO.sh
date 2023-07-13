#!/bin/bash

if id -nG "$USER" | grep -qw "Student"
then 
    if [ $(cat ~/userDetails.txt | awk '{print $6}') == '-' ]
    then
        echo Enter the mess preference order seperated by spaces
        read m1 m2 m3
        if [ $(( m1+m2+m3 )) -eq 6 -a $(( m1*m2*m3 )) -eq 6 -a $(( m1*m2+m2*m3+m3*m1 )) -eq 11 ]
        then
            echo $(awk -v m1="$m1" -v m2="$m2" -v m3="$m3" '{if (NR==1) $6=m1 m2 m3; print $0}' ~/userDetails.txt) > ~/userDetails.txt
            echo $(cat ~/userDetails.txt | awk '{print $2}') >> /home/HAD/mess.txt
        else
            echo Invalid messes entered
        fi
    else
        echo Mess already allocated
    fi
elif id -nG "$USER" | grep -qw "HAD"
then
    messes=($(echo $(awk '{if (NR==2 || NR==3 || NR==4){print $2}}' ~/mess.txt)))
    month=$(date +%b)
    for i in $(cat ~/mess.txt | tail -n +6)
    do  
        filepath=$(grep -lr $i /home/*/*/*/userDetails.txt) #-->test
        pref=$(awk '{print $6}' $filepath)
        p1=${pref:0:1}
        p2=${pref:1:1}
        p3=${pref:2:1}
        for p in $p1 $p2 $p3
        do 
            if [ ${messes[$(( $p - 1 ))]} -gt 0 ]
            then   
                echo $(awk -v p="$p" -v month="$month" '{if (NR==1) $5=p;$6="-";$7=month; print $0}' $filepath) > $filepath
                ##echo "$(awk -v p="$(($p+1))"  '{if (NR==p){print $1, $2-1} else {print $0}}' ~/mess.txt)" > ~/mess.txt updatesthemess.txt
                messes[$(( $p - 1 ))]=$(( ${messes[$(( $p - 1 ))]} - 1 ))
                break
            fi
        done
    done

    for y in /home/*/*/*/userDetails.txt
    do
        for x in 1 2 3
        do
            temp=$( grep "$(cat $y | awk '{print $2}')" ~/mess.txt )
            if [ -z $temp ]
            then
                if [ ${messes[$(( $x - 1 ))]} -gt 0 ]
                then
                    echo $(awk -v x="$x" -v month="$month" '{if (NR==1) $5=x;$6="-";$7=month; print $0}' $y) > $y
                    messes[$(( $x - 1 ))]=$(( ${messes[$(( $x - 1 ))]} - 1 ))
                    break
                fi
            fi
        done
    done

    echo "Mess capacity
1 35
2 35
3 35
Student Preferences" > /home/HAD/mess.txt
 
    
else
    echo Not a member of either of the required groups
fi