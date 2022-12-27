#!/usr/bin/bash
read -p "SELECT 'Column names' separated with ',' 'all' for all columns : " columnNames
read -p "FROM 'table name' : " tableName
read -p "WHERE 'col,comparisonOperator,value' : " whereClause
if [ -e $tableName ]; then
    #add Condition here
    checkResult=$(checkColumnsAndWhere.sh $tableName $columnNames $whereClause)
    if [ $checkResult -eq 1 ]; then
        echo $(selectData.sh $tableName $columnNames $whereClause)
    else
        echo "Some Invalid Inputs"
    fi

else 
   echo "$tableName is not exist !"
fi