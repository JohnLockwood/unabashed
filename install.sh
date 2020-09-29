#!/bin/bash 
##########################################################################
# Name:         install.sh
# Description:  Adds lines installing unabased to the end of .bashrc.  To
#               uninstall, search for the # unabashed section at the end
#               and remove it.
# Usage:        cd <location of install script>
#               ./install.sh
#               source $HOME/.bashrc
##########################################################################

echo "Directory is: $(pwd)"

if [[ "$uab" != "" ]] 
then
    echo -e "\033[0;91mUnabased variable uab already set to $uab."
    echo "Possible re-install?  Please check environment and try again."
    exit 1
fi
uab=$(pwd)
path_to_set='$PATH:$uab/bin:$uab/local'
# echo "$path_to_set"

header=$(cat << EOM

    # Begin unaBashed section
    export uab=$(pwd)
    export PATH="$path_to_set"
    # End unaBashed section
EOM
) # Extra line needed to suppress warning on WSL

# Trim leading space
header=$(sed 's/^[ \t]*//g' <<< $header)
echo "Installing this section to the bottom of .bashrc:"
# echo "$header"
for line in "$header" 
do 
    echo "$line"
    echo "$line" >> $HOME/.bashrc
done
echo
echo "Install complete!"
echo "Try running..."
echo "source "'~'"/.bashrc"
echo "sb hello_world.sh"
echo

