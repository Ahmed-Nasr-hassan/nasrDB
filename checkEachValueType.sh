#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
declare -a columnPk
declare -a columnDatatypes
declare -a insertedRow
columnPk=($(cut -d, -f1 ./$metaDataFile))
columnDatatypes=($(cut -d, -f3 ./$metaDataFile))
insertedRow=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )

i=0
length=${#insertedRow[@]}

while [ $i -lt $length ]; 
do
  currentColumnType=${columnDatatypes[i]}
  # echo "${columnPk[i]}: ${columnNames[i]}: : ${insertedRow[i]}"
  
  if [ "${insertedRow[i]}" -eq "${insertedRow[i]}" ] 2>/dev/null ; then
    currentInputType="int"
  elif [ "${insertedRow[i]}" = "true" ] || [ "${insertedRow[i]}" = "false" ]; then
    currentInputType="boolean"
  else
    currentInputType="str"
  fi
  
  if [ "$currentInputType" != "$currentColumnType" ]; then
      echo 0
      break
  fi
  i=$((i + 1))
done
if [ $i -eq $length ]; then
  echo 1
fi