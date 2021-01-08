# !/bin/bash
# it dsplays the input parameters, and verifies that there is at least one

args=("$@")
SIZE=${#args[@]}
if [ $SIZE == 0 ]; then
    echo "Please input at least one argument"
else
    VAR="Hello"
        for (( i=0;i<$SIZE;i++)); do 
            VAR="$VAR, ${args[${i}]}"
        done
    echo "$VAR"
fi