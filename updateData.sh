#!/usr/bin/bash
tableName=$1
whereClause=$2
colToNewValue=$3

colName=$(echo "$3" | cut -d, -f1)
newValue=$(echo "$3" | cut -d, -f2)
columnIndex=$(getColumnsIndexes.sh $tableName $colName | cut -d, -f1)

metaDataFile=$tableName"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
columnNamesCommas=($(echo "${columnNames[@]}" | sed 's/ /,/g'))


whereData=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
operator="${whereData[1]}"
#Create cases for different operators
case $operator in
'==')
   selectDataEqual.sh $1 $2
   awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
   cat temp2 > .temp.nasr
   rm temp2
   selectDataNotEqual.sh $1 $2
;;
'!=')
    selectDataNotEqual.sh $1 $2
    awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
    cat temp2 > .temp.nasr
    rm temp2
    selectDataEqual.sh $1 $2
;;
'>') 
    selectDataGreaterThan.sh $1 $2
    awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
    cat temp2 > .temp.nasr
    rm temp2
    selectDataSmallerThanAndEqual.sh $1 $2
;;
'>=')
    selectDataGreaterThanAndEqual.sh $1 $2
    awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
    cat temp2 > .temp.nasr
    rm temp2
    selectDataSmallerThan.sh $1 $2
;; 
'<') 
    selectDataSmallerThan.sh $1 $2
    awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
    cat temp2 > .temp.nasr
    rm temp2
    selectDataGreaterThanAndEqual.sh $1 $2
;;
'<=')
    selectDataSmallerThanAndEqual.sh $1 $2
    awk -F, '{sub($'"$columnIndex"', "'"$newValue"'"); print}' .temp.nasr > temp2
    cat temp2 > .temp.nasr
    rm temp2
    selectDataGreaterThan.sh $1 $2
;; 
*)
    echo "Not valid operator"
esac
cat .temp.nasr > ./$tableName 
rm .temp.nasr