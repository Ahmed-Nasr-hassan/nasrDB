#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
columnsTypes=($(cut -d, -f3 ./$metaDataFile))
i=0
length=${#columnNames[@]}

while [ $i -lt $length ]; 
do
  if [ "$2" == "${columnNames[$i]}" ]; then
      echo "${columnsTypes[$i]}" 
      break
  fi
  i=$((i + 1))
done
