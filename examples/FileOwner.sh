#!/bin/bash 
##########################################################################
# Name:         FileOwner.sh
# Description:  using the output of ls -l, displays filename and owner 
#               information.
#                
#               This is the shell script version of a beginner exercise
#               in awk programming given in Bruce Barnett's excellent 
#               awk tutorial (https://www.grymoire.com/Unix/Awk.html)
# Usage:        ls -l | ./FileOwner.sh
# Notes:        Some unix systems may need to change $9 to $8
##########################################################################

awk '
BEGIN { print "File/Owner" }
{ print $9, "\t", $3}
END { print " - DONE -" }
'