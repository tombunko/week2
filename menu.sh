#!/bin/bash

# This program prompts for the secret password,
# creates a hash of the password entered, 
# then compares the hash value against the hash value stored in file secret.txt

# If the password entered is correct, it issues a menu for the operator to choose one of the following:
#   1) to create a new folder (runs script foldermaker.sh)
#   2) to copy a folder (runs script foldercopier.sh)
#   3) to set a password (runs script password.sh)

# ask for the password, hash it using sha256, then compare to the one stored in file secret.txt
exit="N"

read -sp "enter password. " user_password       # get password
echo $user_password | sha256sum > testpwd.txt
#hashedpw=$user_password | sha256sum             # get hash value of entered password
hashedpw="$(cat testpwd.txt)"
savedpw="$(cat secret.txt)"                     # load value of secret.txt to variable savedpw

if [ "$hashedpw" == "$savedpw" ]; then
	echo "Access Granted"
while [ $exit = "N" ]; do

	clear
	echo ""
	echo -e "      \e[40;38;5;82m    File Admin Menu \e[0m"  #header banner style
	echo ""
	echo -e " \e[1;4m Select an Option \e[0m"      #bold and underline
        echo ""
	echo "     1 - Create a Folder"                #runs foldermaker.sh
	echo "     2 - Copy a Folder"                  #runs foldercopier.sh
	echo "     3 - Set the Password"               #runs setpassword.sh
	echo "     4 - Quit"                           #ends the program
	echo ""
        read -p "Enter Selection -> " interact         #whatever the operator enters in the screen

	string=$interact
	case "$interact" in
		1 ) ./foldermaker.sh
			;;
		2 ) ./foldercopier.sh
			;;
                3 ) ./setpassword.sh
			;;
                4 ) exit="Y"
			;;
                q ) exit="Y"
			;;
		Q ) exit="Y"
			;;	
	esac
done

else
	echo "Access Denied"
	echo "Goodbye"
	return=1
fi





