#!/usr/bin/bash
read -p "Enter Database name : " name
if [ $(checkRegex.sh "$name") == 1 ]; then 
    if [ -e $name ]; then
        echo "Connected to $name"
        cd $name
        tableMenu.sh
    else 
        echo "No database with name : $name"
    fi
else 
    echo "Name shouldn't have regex or start with a number"
fi


