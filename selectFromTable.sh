#!/usr/bin/bash
read -p "SELECT 'Column names' separated with ',' 'all' for all columns : " columnNames
read -p "FROM 'table name' : " tableName
read -p "WHERE 'col,comparisonOperator,value' : " whereClause
if [ -e $tableName ]; then
    #add Condition here
    echo $(checkColumnsAndWhere.sh $tableName $columnNames $whereClause)
    echo $(selectData.sh $tableName $columnNames $whereClause)
else 
   echo "$tableName is not exist !"
fi