# !/bin/bash
# it dsplays the input parameters, and verifies that there is at least one
echo "WELCOME TO  THIS ATM"

op=""
record=()

while :
do
    #Clean the terminal
    # clear
    #Display options
    echo "______________________________"
    echo "          main menu           "
    echo "______________________________"
    echo "A.) Add a bank movement"
    echo "B.) Search a bank movement"
    echo "C.) List the bank movements"
    echo "D.) Calculate the balance"
    echo "E.) Exit the program"

    read -n1 -p "choose an opcion [A-E]: " op
    

    # Add a bank movement
    add () {
        SIZE=${#record[*]}
        read -n9999 -p "Input how much money you want to Add: " movement

        record["$SIZE"]=$movement
    }

    search () {
        read -n9999 -p "Input how much money the transfer you're looking for was: " field
        SIZE=${#record[*]}
        found=0
        for (( i=0;i<$SIZE;i++)); do
            if [[ $field == ${record[${i}]} ]]; then
                found=$(( $found + 1 ))
                echo "The bank movement that you are looking for is at $i position"
            fi
        done
        if [[ $found == 0 ]]; then
            echo "There were no matches"
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
        "A") echo -e "\nAdd a bank movement"
            add
            ;;

        "B") echo -e "\nSearch a bank movement"
            search
            sleep 3
            ;;

        "C") echo -e "\nList the bank movements"
            list
            sleep 3
            ;;

        "D") echo -e "\nCalculate the balance"
            balance
            sleep 3
            ;;
        
        "E") echo -e "\nExit the program"
            exit 0
            ;;
    esac

done