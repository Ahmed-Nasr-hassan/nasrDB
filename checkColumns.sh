#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
selectedColumns=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )

checker=1
for col in "${selectedColumns[@]}"; 
do
    if [[ "${columnNames[@]}" =~ "$col" ]]; then
        continue
    else
        checker=0
        break
    fi
done
echo $checker