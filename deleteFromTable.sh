#!/usr/bin/bash
read -p "delete FROM 'table name' : " tableName
read -p "WHERE 'col,comparisonOperator,value' : " whereClause
if [ -e $tableName ]; then
    #add Condition here
    checkResult=$(checkWhere.sh $tableName $whereClause)
    if [ $checkResult -eq 1 ]; then
        echo $(deleteData.sh $tableName $whereClause)
    else
        echo "Some Invalid Inputs"
    fi

else 
   echo "$tableName is not exist !"
fi