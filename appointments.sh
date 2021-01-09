# !/bin/bash
# Add a bank movement
clear
echo -e "\nThe option CALLED $op"
record=()
currentDate=`date --date='tomorrow' +"%D"`
add () {
    SIZE=${#record[*]}
    read -n2 -p "Enter the time (HH) you want to be scheduled tomorrow ($currentDate): " new_appointment
    search $new_appointment
}

search () {
    echo -e "\nYou want to be scheduled at $1:00"
    SIZE=${#record[*]}
    found=0
    for (( i=0;i<$SIZE;i++)); do
        if [[ $field == ${record[${i}]} ]]; then
            found=$(( $found + 1 ))
            echo "This appointment is already taken"
        fi
    done
    if [[ $found == 0 ]]; then
        record["$SIZE"]=$new_appointment
        echo -e "You're been scheduled \n `date --date='tomorrow' +"%T %D"`"
    else
        echo "there were $found matches"
    fi
    
} 

list () {
    echo "${record[*]}"
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
        ;;

    "2") echo -e "\nSearch a bank movement"
        search
        sleep 3
        ;;

    "3") echo -e "\nList the bank movements"
        list
        sleep 3
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

sleep 2