#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
whereData=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
comparisonOperators=( "=" "!=" ">" "<" ">=" "<=" "==" )
checker=1
if [[ "${columnNames[@]}" =~ "${whereData[0]}" ]]; then
    uselessVar=0
else
    checker=0
fi

if [[ "${comparisonOperators[@]}" =~ "${whereData[1]}" ]]; then
    uselessVar=0
else
    checker=0
fi
echo $checker