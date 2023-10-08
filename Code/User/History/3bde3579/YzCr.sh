#/bin/bash

while IFS= read -r line
    do
        line=($line) 
        #Name House_Number District City Income Tax_Paid
        #echo ${line[@]}
        address="${line[1]}-${line[2]}-${line[2]}"
        touch temp.txt
        if cat temp.txt | grep "$address" 
        then
            if [ "${line[5]}" -eq 'No' ]
            then
                lineno=$(cat temp.txt | grep -n "$address" | cut -d: -f1)
                income=${line[4]}
                income=$((($income * 2)/10))
                echo $(awk -v lineno="$lineno" -v income="$income" '{if (NR==lineno) $2=$2+income; print $0}' temp.txt) > temp.txt
            fi
        else
            if [ "${line[5]}"='No' ]
            then
                income=${line[4]}
                income=$((($income * 2)/10))
            echo $address $income >> temp.txt
            fi
        fi
    done < <(tail -n +2 '/home/jagannathanm/Documents/on-site1/City_tax_Records.txt')