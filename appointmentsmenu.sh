# !/bin/bash
# it dsplays the input parameters, and verifies that there is at least one
echo "WELCOME TO APPOINNTMENTS MENU"

op=""

while :
do
    #Clean the terminal
    clear
    #Display options
    echo "______________________________"
    echo "          main menu           "
    echo "______________________________"
    echo "1. Add a new appointment."
    echo "2. Search by patient name."
    echo "3. Find appointments by starting hour."
    echo "4. Search for appointments by end time."
    echo "5. List appointments ordered by patient name. "
    echo "6. List the appointments ordered by starting time. "
    echo "7. Exit the program."

    read -n1 -p "choose an opcion [1-7]: " op
    
    if [[ $op ]]; then
        export op
        ./appointments.sh
        sleep 3
    fi
done