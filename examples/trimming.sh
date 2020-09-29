#!/bin/bash 
##########################################################################
# Name:         trimming.sh
# Description:  Trimming examples based on 
#               http://sed.sourceforge.net/sedfaq3.html
# Usage:        ./trimming.sh
##########################################################################

# Trimming start of variable

header=$(cat << EOM
    Hey Moe.
    Hey Larry.
EOM
) # Extra line needed to suppress warning on WSL

echo Header follows:
echo "$header"

echo Header after trimming:
header=$(cat << EOM
    Hey Moe.
    Hey Larry.
EOM
) # Extra line needed to suppress warning on WSL

echo Header follows:
echo "$header"

# Trim
header=$(sed 's/^[ \t]*//g' <<< $header)
echo Header after trimming:
echo "$header"