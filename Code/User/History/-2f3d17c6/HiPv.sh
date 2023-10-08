#/bin/bash
for i in {1..100}
do  
    list1=($(curl -s http://first.mess.local))
    a1=${list1[1]}
    echo $a1 >> temp1.txt

    list2=($(curl -s http://second.mess.local))
    a2=${list2[1]}
    echo $a2 >> temp2.txt

    list3=($(curl -s http://third.mess.local))
    a3=${list3[1]}
    echo $a3 >> temp3.txt

done
echo "MESS 1"
cat temp1.txt | sort | uniq -c
echo "MESS 2"
cat temp2.txt | sort | uniq -c
echo "MESS 3"
cat temp3.txt | sort | uniq -c
rm temp*.txt