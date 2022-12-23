#!/usr/bin/bash
read -p "Enter Database name : " name
if [ -e $name ]; then
    rm -r $name
    echo "$name has been deleted"
else 
    echo "No database with name : $name"
fi
