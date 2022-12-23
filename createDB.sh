#!/usr/bin/bash

read -p "Enter Database name : " name
if [ -e $name ]; then
    echo "The name is already exist"
else 
    mkdir ./$name
    echo "$name has created"
fi
