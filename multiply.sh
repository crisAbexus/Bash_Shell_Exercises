# !/bin/bash
# 6. Make a script called 'multiply' that multiplies the 2 entered parameters (you will have to be able to multiply decimal numbers, like 2.2 * 3).

args=("$@")
SIZE=${#args[@]}
if [ $SIZE -ne 2 ]; then
    echo "Please input TWO arguments"
else
    echo "$1*$2" | bc -l
fi