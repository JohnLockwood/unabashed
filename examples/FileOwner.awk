#!/usr/bin/awk 
##########################################################################
# Name:         FileOwner.awk
# Description:  using the output of ls -l, displays filename and owner 
#               information.
#                
#               This is the awk script version of a beginner exercise
#               in awk programming given in Bruce Barnett's excellent 
#               awk tutorial (https://www.grymoire.com/Unix/Awk.html)
# Usage:        ls -l | ./FileOwner.awk
# Notes:        Some unix systems may need to change $9 to $8
##########################################################################

BEGIN { print "File/Owner" }
{ print $9, "\t", $3}
END { print " - DONE -" }

