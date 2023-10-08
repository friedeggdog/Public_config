#/bin/bash
for i in {1..100}
do  
    list=($(curl http://first.mess.local))
    a=${list[1]}
    touch temp.txt
    echo $a >> temp.txt

done

cat temp.txt | sort |uniq -c
rm temp.txt