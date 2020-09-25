#!/bin/bash 
##########################################################################
# Name:         mapfile.sh
# Description:  Am example of the mapfile, showing both mapping the file
#               to an array and using a callback.  Prints its own lines.
# Usage:        ./mapfile.sh
##########################################################################

function print_line_number_and_line {
    # The $(($1+1)) expression uses arithmetic expansion to convert zero-based line num 
    echo "Line $(($1+1)): $2"
}

# reads all lines, displaying line index and content for each line
# -t trims the line, -C specifies the callback, -c 1 means print each line
# without skipping any.  And of course we're
mapfile -t -C print_line_number_and_line -c 1 my_arr < "$0"

# Given that we explicitly also saved the array while we were at it,
# We can re-print the first line
echo
echo "That first line again was ${my_arr[0]}"
