#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
declare -a columnNames
declare -a insertedRow
columnNames=($(cut -d, -f2 ./$metaDataFile))
insertedRow=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
if [ ${#insertedRow[@]} != ${#columnNames[@]}  ]; then
  echo 0
else
  checkValuesTypes=$(checkEachValueType.sh $1 $2)
  checkUniquePk=$(checkUniquePk.sh $1 $2)
  echo $(($checkUniquePk * $checkValuesTypes ))
fi
