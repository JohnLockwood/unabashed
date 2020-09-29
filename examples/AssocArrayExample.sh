#!/bin/bash

declare -A vals

vals[stooge]=Shemp

# Reference an array passed in as an argument.  This is a bit of demo-ish overkill, 
# since we could have modified the global associative array directly.
change_stooge() {
    # Works in 4.3 or later cf 
    # https://bit.ly/2FAeuFP
    # Nobody likes getting a Shemp, so change it.
    local -n arr=$1
    arr[stooge]=Curly
}

echo "Nobody likes watching the Three Stoges and getting a ${vals[stooge]}."

change_stooge vals

echo "Everybody wants to watch one with ${vals[stooge]} in it."

