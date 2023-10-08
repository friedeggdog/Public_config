#/bin/bash
for i in {1..100}
do  
    list=($(curl -s http://first.mess.local))
    a=${list[1]}
    echo $a >> temp1.txt

done

cat temp.txt | sort | uniq -c
rm temp.txt