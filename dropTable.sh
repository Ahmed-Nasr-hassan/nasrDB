#!/usr/bin/bash
read -p "Enter table name : " name
if [ -e $name ]; then
    rm $name
    rm $name'_MetaData'
    echo "$name has been deleted"
else 
    echo "No table with name : $name"
fi
