#!/usr/bin/bash
tablename=$1
selectedColumns=$2
whereClause=$3
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
if [ "$2" == 'all' ]; then 
    checkColumns=1
else
    checkColumns=$(checkColumns.sh $1 $2 )
fi
checkWhere=$(checkWhere.sh $1 $3 )


echo $(($checkColumns * $checkWhere))
