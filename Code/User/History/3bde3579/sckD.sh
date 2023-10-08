#/bin/bash

while IFS= read -r line
    do
        line=($line) 
        #
        echo ${line[@]}
    done < <(tail -n +2 '/home/jagannathanm/Documents/on-site1/City_tax_Records.txt')