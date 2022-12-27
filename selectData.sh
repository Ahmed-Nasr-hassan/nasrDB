#!/usr/bin/bash
tablename=$1
selectedColumns=$2
whereClause=$3
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
whereData=( $(echo "$3" | cut -d, -f1- --output-delimiter=" ") )

columnName="${whereData[0]}"
columnIndex=$(cut -d, -f2 ./$metaDataFile | grep -n "$columnName" | cut -d: -f1)
columnValues=()

while read -r line; do
    columnValues+=("$line")
done < <(cut -d, -f$columnIndex ./$tablename)

operator="${whereData[1]}"
value="${whereData[2]}"
reqRows=$( awk -v value="$value" -v ORS='\n' '$1 == value {print NR-1}' <<< "${columnValues[@]}" )
readarray -t tableAsArray < $tablename

index=0
reqRows=()
for i in "${columnValues[@]}"; do
    if [[ "$i" == "$value" ]]; then
        reqRows+=("$index")
    fi
    index=$((index + 1))
done

resultRows=$( for i in "${reqRows[@]}";
do
    echo "${tableAsArray[$i]}"
done )


#Create cases for different operators


