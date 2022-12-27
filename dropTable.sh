#!/usr/bin/bash
read -p "Enter table name : " name
if [ $(checkRegex.sh "$name") == 1 ]; then 
    if [ -e $name ]; then
        rm $name
        rm $name'_MetaData'
        echo "$name has been deleted"
    else 
        echo "No table with name : $name"
    fi
else 
    echo "Name shouldn't have regex or start with a number"
fi