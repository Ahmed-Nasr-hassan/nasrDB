#!/usr/bin/bash
read -p "Update 'table name' : " tableName
read -p "WHERE 'col,comparisonOperator,value' : " whereClause
read -p "to 'col,newValue' : " colToNewValue
if [ -e $tableName ]; then
    #add Condition here
    checkResult=$(checkNewValueAndWhere.sh $tableName $whereClause $colToNewValue)
    if [ $checkResult -eq 1 ]; then
        echo $(updateData.sh $tableName $whereClause $colToNewValue)
    else
        echo "Some Invalid Inputs"
    fi

else 
   echo "$tableName is not exist !"
fi