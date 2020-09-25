#!/bin/bash

declare -A vals

vals[stooge]=Shemp
vals[name]=John   

change_stooge() {
    # Works in 4.3 or later cf 
    # https://bit.ly/2FAeuFP
    # Nobody likes getting a Shemp, so change it.
    local -n arr=$1
    arr[stooge]=Curly
}

change_stooge

echo "Nobody likes watching the Three Stoges and getting a ${vals[stooge]}"
echo "${vals[name]}'s favorite stooge is ${vals[stooge]}"
