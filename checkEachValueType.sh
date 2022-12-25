#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
declare -a columnDatatypes
declare -a insertedRow
columnDatatypes=($(cut -d, -f3 ./$metaDataFile))
insertedRow=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )

i=0
length=${#insertedRow[@]}

while [ $i -lt $length ]; 
do
  currentColumnType=${columnDatatypes[i]}  
  currentInputType="$(getValueType.sh ${insertedRow[i]})"
  if [ "$currentInputType" != "$currentColumnType" ]; then
      echo 0
      break
  fi
  i=$((i + 1))
done
if [ $i -eq $length ]; then
  echo 1
fi