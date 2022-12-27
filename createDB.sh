#!/usr/bin/bash

read -p "Enter Database name : " name
if [ $(checkRegex.sh "$name") == 1 ]; then 
    if [ -e $name ]; then
        echo "The name is already exist"
    else 
        mkdir ./$name
        echo "$name has been created"
    fi
else 
    echo "Name shouldn't have regex or start with a number"
fi
