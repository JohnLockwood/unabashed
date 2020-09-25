#!/bin/bash 
##########################################################################
# Name:         ScriptPath.sh
# Description:  Displays various path related information about the
#               currently executing script.
# Usage:        ./ScriptPath.sh
# Notes:        This actually turns out to be complicated, and depends 
#               on where you run it from!  But also bin/getdir, which
#               does a better job.
##########################################################################

echo "1. The script path is ${0}"
echo "The script directory is $(dirname ${0})"
echo "The current working directory is $(pwd)"
echo "The BASH_SOURCE for the script is ${BASH_SOURCE}"

echo "The BASH_SOURCE for the script is ${BASH_SOURCE[@]}"

echo "An expression related to BASH_SOURCE is: ${BASH_SOURCE%/*}/"
