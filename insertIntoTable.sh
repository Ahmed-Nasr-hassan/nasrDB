#!/usr/bin/bash
read -p "Enter table name : " tablename
if [ -e $tablename ]; then
    askForRowsData.sh $tablename
else 
   echo "$tablename is not exist !"
fi