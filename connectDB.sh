#!/usr/bin/bash
read -p "Enter Database name : " name
if [ -e $name ]; then
    echo "Connected to $name"
    cd $name
    tableMenu.sh
else 
    echo "No database with name : $name"
fi

