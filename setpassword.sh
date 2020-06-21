#!/bin/bash
# This program asks for a new user password, hashes it using sha256, then stores it in file secret.txt
read -sp "enter password. " user_password
echo $user_password | sha256sum > secret.txt
exit 0
