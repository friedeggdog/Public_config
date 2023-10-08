#/bin/bash

while IFS= read -r line
    do
        line=($line) 
        #Name House_Number District City Income Tax_Paid
        #echo ${line[@]}
        address="${line[1]} ${line[2]} ${line[2]}"
        touch temp.txt
        if cat temp.txt | grep "$address" 
        then
            echo "ok"
        else
            echo $address >> temp.txt
        fi
    done < <(tail -n +2 '/home/jagannathanm/Documents/on-site1/City_tax_Records.txt')