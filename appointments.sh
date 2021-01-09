# !/bin/bash
# Add a bank movement
clear
echo -e "\nThe option CALLED $op"
echo -e "\nThe Agenda starts as: ${record[*]}"
currentDate=`date --date='tomorrow' +"%D"`
add () {
    SIZE=${#record[*]}
    clear
    read -n2 -p "Enter the time (HH) you want to be scheduled tomorrow ($currentDate): " new_appointment
    result=$(search $new_appointment)
    echo -e "\n******the result: $result"
    if [[ $result ]]; then
        record["$SIZE"]=$new_appointment
        echo -e "You're been scheduled tomorrow `date --date='tomorrow' +"%D"` at $new_appointment:00"
        echo -e "\n Agenda:\n${record[*]}"
        # export record
    fi
}

search () {
    echo -e "\nYou want to be scheduled at $1:00"
    SIZE=${#record[*]}
    found=0
    for (( i=0;i<$SIZE;i++)); do
        if [[ $field == ${record[${i}]} ]]; then
            found=$(( $found + 1 ))
            echo "This appointment is already taken"
            local result=0
            return $result
        else
            local result=1
            return $result
        fi
    done    
} 

list () {
    echo "${record[*]}"
    sleep 5
} 

balance () {
    SIZE=${#record[*]}
    VAR=0
    for (( i=0;i<$SIZE;i++)); do 
        VAR=$(($VAR+${record[${i}]}))
    done
    echo "your balance is: $VAR"
} 

case $op in
    "1") echo -e "\n1. Add a new appointment."
        add
        # # export record
        ;;

    "2") echo -e "\nSearch a bank movement"
        search
        sleep 3
        ;;

    "3") echo -e "\nThe Agenda tomorro is: "
        list
        ;;

    "4") echo -e "\nCalculate the balance"
        balance
        sleep 3
        ;;
    
    "5") echo -e "\nExit the program"
        exit 0
        ;;

    "6") echo -e "\nExit the program"
        exit 0
        ;;
                
    "7") echo -e "\nExit the program"
        exit 0
        ;;
esac

echo -e "\nThe Agenda finishes as: ${record[*]}"
clear
sleep 2
echo ${record[*]}