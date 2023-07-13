

while :; do
    sleep 60
    ids = $(ps aux | awk '{if ($3 > 60) print $2}')
    for i in $ids
    do
        kill $i
    done
done