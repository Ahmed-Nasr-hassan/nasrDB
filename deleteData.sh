#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))


whereData=( $(echo "$2" | cut -d, -f1- --output-delimiter=" ") )
operator="${whereData[1]}"
#Create cases for different operators

case $operator in
'==')
    selectDataNotEqual.sh $1 $2
;;
'!=')
    selectDataEqual.sh $1 $2
;;
'>') 
    selectDataSmallerThanAndEqual.sh $1 $2
;;
'>=')
    selectDataSmallerThan.sh $1 $2
;; 
'<') 
    selectDataGreaterThanAndEqual.sh $1 $2
;;
'<=')
    selectDataGreaterThan.sh $1 $2
;; 
*)
    echo "Not valid operator"
esac
cat .temp.nasr > ./$tablename 
rm .temp.nasr
