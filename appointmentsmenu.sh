# !/bin/bash
# it dsplays the input parameters, and verifies that there is at least one
echo "WELCOME TO APPOINNTMENTS MENU"

op=""
record=$record
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

    echo "the record ${record[*]}"
    read -n1 -p "**choose an opcion [1-7]: " op
    
    if [[ $op ]]; then
        export op
        export record
        record=$( ./appointments.sh )
        echo "the agenda is returned as: ${record}"
        sleep 3
    fi
done