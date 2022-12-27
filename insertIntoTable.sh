#!/usr/bin/bash
read -p "Enter table name : " tablename

if [ $(checkRegex.sh "$name") == 1 ]; then 

    if [ -e $tablename ]; then
        askForRowsData.sh $tablename
    else 
    echo "$tablename is not exist !"
    fi

else 
    echo "Name shouldn't have regex or start with a number"
fi

