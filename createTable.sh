#!/usr/bin/bash

read -p "Enter Table name : " name
if [ $(checkRegex.sh "$name") == 1 ]; then 
    if [ -e $name ]; then
        echo "The name is already exist"
    else 
        touch ./$name
        touch ./$name'_MetaData'
        echo "$name has been created"
        askForColumnsData.sh $name
    fi
else 
    echo "Name shouldn't have regex or start with a number"
fi
