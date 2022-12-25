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
        if [ $checkResult -eq 1 ]; then
            echo "$insertedRow" >> ./$1
        else
            echo "Inputs should be equal to number of columns, matching datatypes and pk is unique"
        fi
    ;;
    "Done")
        break
    ;;
    *)
    echo "Not valid option"
    esac
    echo "1) Add Row  2) Done"
done
