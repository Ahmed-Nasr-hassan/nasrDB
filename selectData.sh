#!/usr/bin/bash
tablename=$1
selectedColumns=$2
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
columnNamesCommas=($(echo "${columnNames[@]}" | sed 's/ /,/g'))

echo ${columnNamesCommas[@]} >> .temp.nasr

whereData=( $(echo "$3" | cut -d, -f1- --output-delimiter=" ") )
operator="${whereData[1]}"
#Create cases for different operators

case $operator in
'==')
   selectDataEqual.sh $1 $3
;;
'!=')
    selectDataNotEqual.sh $1 $3
;;
'>') 
    selectDataGreaterThan.sh $1 $3
;;
'>=')
    selectDataGreaterThanAndEqual.sh $1 $3
;; 
'<') 
    selectDataSmallerThan.sh $1 $3
;;
'<=')
    selectDataSmallerThanAndEqual.sh $1 $3
;; 
*)
    echo "Not valid operator"
esac
# cat .temp.nasr #can add limit of view using head and tail commands
column -s, -t .temp.nasr
rm .temp.nasr
# Select specific columns (In progress)
# selectedColumnsIndex=$( getColumnsIndexes.sh $tablename $selectedColumns )
# indexesArray=( $(echo "$selectedColumnsIndex" | cut -d, -f1- --output-delimiter=" " ) )
# if [[ $selectedColumns == "all" ]]; then
#     echo 'all'

# else
#     # echo $(paste -d, <(cut -d, -f${indexesArray[0]} $tablename )  <(cut -d, -f${indexesArray[1]}  $tablename )  <(cut -d, -f${indexesArray[2]}  $tablename ) ) 2> /dev/null >> testfile 
# fi