if id -nG "$USER" | grep -qw "jagannathanm" ###
then
    echo $USER belongs to Student
    if [ ! -s "~/fees.txt" ]
    then
        echo "TuitionFee 0
HostelRent 0
ServiceCharge 0
MessFee 0" > "/home/jagannathanm/fees.txt" ###
    fi

    TuitionFee=$(( $1 + $(cat ~/fees.txt | awk 'NR==1{print $2}') ))
    HostelRent=$(( $2 + $(cat ~/fees.txt | awk 'NR==2{print $2}') ))
    ServiceCharge=$(( $3 + $(cat ~/fees.txt | awk 'NR==3{print $2}') ))
    MessFee=$(( $4 + $(cat ~/fees.txt | awk 'NR==4{print $2}') ))

    if [ $TuitionFee -le 25000 -a $HostelRent -le 10000 -a $ServiceCharge -le 5000 $MessFee -le 10000 ]
    then
        echo "TuitionFee $TuitionFee
HostelRent $HostelRent
ServiceCharge $ServiceCharge
MessFee $MessFee" > "~/fees.txt"
        
        echo Fees to be payed are TuitionFee:$(( 25000 - $TuitionFee )) HostelRent:$(( 25000 - $HostelRent )) ServiceCharge:$(( 25000 - $ServiceCharge )) MessFee:$(( 25000 - $MessFee ))
    else
        echo Fees payed is greater than required in at least one of the fields
        echo Current fees payed already is TuitionFee:$(( $TuitionFee - $1 )) HostelRent:$(( $HostelRent - $2 )) ServiceCharge:$(( $ServiceCharge - $3 )) MessFee:$(( $MessFee - $4 ))
        echo Required Fees are TuitionFee:25000 HostelRent:10000 ServiceCharge:5000 MessFee:10000
    fi
else
    echo $USER does not belong to Student
fi