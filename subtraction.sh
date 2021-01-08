# !/bin/bash
# performs the subtraction of 2 entered parameters (you will have to be able to add decimal numbers, such as 2.2 - 3).

args=("$@")
SIZE=${#args[@]}
if [ $SIZE -ne 2 ]; then
    echo "Please input TWO arguments"
else
    echo "$1-$2" | bc -l
fi