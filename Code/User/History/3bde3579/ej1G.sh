#/bin/bash

while IFS= read -r line
    do
        line=($line) 
        address="${line[1]}-${line[2]}-${line[3]}"
        touch tax.txt
        if cat tax.txt | grep -q "$address" 
        then
            if [ "${line[5]}" == 'No' ]
            then
                lineno=$(cat tax.txt | grep -n "$address" | cut -d: -f1)
                income=${line[4]}
                income=$(echo "$income*0.2" | bc)
                echo "$(awk -v lineno="$lineno" -v income="$income" '{if (NR==lineno) $2=$2+income; print $0}' tax.txt)" > tax.txt
            fi
        else
            if [ "${line[5]}" == 'No' ]
            then
                income=${line[4]}
                income=$(echo "$income*0.2" | bc)
                echo "$address $income" >> tax.txt
            fi
        fi
    done < <(tail -n +2 '/home/jagannathanm/Documents/on-site1/City_tax_Records.txt')