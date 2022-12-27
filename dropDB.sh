#!/usr/bin/bash
read -p "Enter database name : " name
if [ $(checkRegex.sh "$name") == 1 ]; then 
    if [ -e $name ]; then
        rm -r $name
        echo "$name has been deleted"
    else 
        echo "No database with name : $name"
    fi
else 
    echo "Name shouldn't have regex or start with a number"
fi