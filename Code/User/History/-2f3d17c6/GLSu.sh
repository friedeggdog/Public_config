#/bin/bash
for i in {1..1000}
do  
    list=($(curl -s http://first.mess.local))
    a=${list[1]}
    touch temp.txt
    echo $a >> temp.txt

done

cat temp.txt | sort | uniq -c
rm temp.txt