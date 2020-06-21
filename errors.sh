#!/bin/bash
 secret='shhh' # Don't tell anyone!
 corr="true1"
 wrng="false1"
 # if the user types in the correct secret, tell them they got it right!
 
 read -sp $'What\'s the secret code? ' REPLY
 echo ""

 if [ "$secret" == "$REPLY" ]; then
      echo 'You got it right'
 else
     corr=$wrng
     echo 'You got it wrong :('
 fi
 
 case "$corr" in
 false1 )
     echo "Go Away!" # people who get it wrong need to be told to go away!
     ;;
 true1 )
     echo "you have unlocked the secret menu!"
     # TODO: add a secret menu for people in the know.
     ;;
 esac
