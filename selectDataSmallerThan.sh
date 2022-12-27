#!/usr/bin/bash
tablename=$1
whereClause=$2
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
columnNamesCommas=($(echo "${columnNames[@]}" | sed 's/ /,/g'))
whereData=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )

columnName="${whereData[0]}"
columnIndex=$(cut -d, -f2 ./$metaDataFile | grep -n "$columnName" | cut -d: -f1)
declare -a columnValues=()
while read -r line; do
    columnValues+=($line)
done < <(cut -d, -f$columnIndex ./$tablename)

# operator="${whereData[1]}"
declare -i value=${whereData[2]}
readarray -t tableAsArray < $tablename

index=0
reqRows=()
for i in ${columnValues[@]}; do
    if [[ $i -lt $value ]]; then
        reqRows+=($index)
    fi
    index=$((index + 1))
done

resultRows=()
for i in "${reqRows[@]}";
do
    resultRows+=("${tableAsArray[$i]}")
    echo "${tableAsArray[$i]}" >> .temp.nasr
done

