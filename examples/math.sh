#!/bin/bash 
##########################################################################
# Name:         math.sh
# Description:  Showing some basic Math and other expressions
# Usage:        math.sh
# Notes:        This example scratches the surface only.
#               A good treatment of arithmetic expressions in bash 
#               can be found here: https://bit.ly/3kHkhYO
##########################################################################

# Math expressions on integers can be done in double parens, 
# which are called "compound expressions"
(( somevalue=2+2 ))
echo "2 + 2 is $somevalue, of course!"


# Unlike in bash generally, spaces are fine before the equals, 
# after it, or both

(( eight = 2 * 4 )) 
echo "2 * 4 is $eight, of course!"

# You can also set the variable outside the parens, but here 
# the bash rules for "=" apply.  This is sometimes called
# arithmetic expansion
ten=$(( $eight + 2 ))
echo $ten

# A slower way to do it because it calls a separate process is 
# to us expr
five=$(expr 3 + 2)
echo "Five, from expr:  $five"

# Declare also works to force variables to be evaluated as an 
# int
declare -i myint=3
myint=3+1
echo $myint

# Regular variables don't behave this way
mysomething=3

# One easy way to do floating point math is to use awk
echo "Two thirds ~= $(awk 'BEGIN {print 2/3}')"

# You can also use bc.  Using -l loads a standard math
# library with the scale set to 20
echo "1/7 ~= $(echo "1/7" | bc -l)"

# You can also set the scale explicitly.  
echo "Less precisely, 1/7 ~= $(echo "scale=3; 1/7" | bc -l)"

# See the command line manual for bc
# https://www.gnu.org/software/bc/manual/html_mono/bc.html
echo "And now for dessert, a slice of pi"
echo "scale=10; 4*a(1)" | bc -l