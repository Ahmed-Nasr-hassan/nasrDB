#!/usr/bin/bash
tablename=$1
whereClause=$2
colToNewValue=$3
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))

checkColToNewValue=$(checkColToNewValue.sh $1 $3)
checkWhere=$(checkWhere.sh $1 $2 )

echo $(($checkColToNewValue * $checkWhere))
