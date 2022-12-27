#!/usr/bin/bash
tablename=$1
colToNewValue=$2
colName=$(echo "$2" | cut -d, -f1)
value=$(echo "$2" | cut -d, -f2)

valueType="$(getValueType.sh $value)"
columnType="$(getColumnType.sh $tablename $colName)"

if [ "$valueType" == "$columnType" ]; then
    echo 1
else
    echo 0
fi