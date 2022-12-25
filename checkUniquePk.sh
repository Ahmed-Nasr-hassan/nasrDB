#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
# declare -a columnPkMetaData
declare -a insertedRow
declare -a columnPk
# columnPkMetaData=($(cut -d, -f1 ./$metaDataFile))
insertedRow=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
# pkColumnName=$(grep "^pk" ./$metaDataFile | cut -d, -f2)
pkColumnNumber=$(grep -n "^pk" ./$metaDataFile | cut -d: -f1)
columnPk=( $(cut -d, -f$pkColumnNumber ./$tablename) )
currentPk=${insertedRow[$pkColumnNumber-1]}

if [[ "${columnPk[@]}" =~ "$currentPk" ]]; then
    echo 0
else
    echo 1
fi