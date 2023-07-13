if id -nG "$USER" | grep -qw "Warden"
then

else
    echo $USER does not belong to Warden
fi