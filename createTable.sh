#!/usr/bin/bash

read -p "Enter Table name : " name
if [ -e $name ]; then
    echo "The name is already exist"
else 
    touch ./$name
    touch ./$name'_MetaData'
    echo "$name has been created"
fi

#Ask about datatypes and primary key