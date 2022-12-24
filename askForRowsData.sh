#!/usr/bin/bash
tablename=$1
metaDataFile=$tablename"_MetaData"
columnNames=($(cut -d, -f2 ./$metaDataFile))
echo "Add rows data one by one separated with ',', current rows are : ${columnNames[@]} "
select i in "Add Row" "Done";
do
    case $i in
    "Add Row")
        read -p "Add row data : " insertedRow
        checkResult=$(check.sh $tablename $insertedRow)
        echo $checkResult
        # echo "$pk,$name,$datatype" >> ./$1
    ;;
    "Done")
        break
    ;;
    *)
    echo "Not valid option"
    esac
    echo "1) Add Row  2) Done"
done
