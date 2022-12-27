#!/usr/bin/bash
tablename=$1
selectedColumns=$2
arrayOfColumnNames=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
indexes=()
i=0
length=${#columnNames[@]}
while [ $i -lt $length ]; 
do
    if [[ $selectedColumns == "all" ]]; then
        break
    fi

    if [[ "${arrayOfColumnNames[@]}" =~ "${columnNames[$i]}" ]]; then
        indexes+=$((i + 1))
        indexes+=","
    fi

  i=$((i + 1))
done
echo $indexes