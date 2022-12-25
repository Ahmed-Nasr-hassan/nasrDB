#!/usr/bin/bash
echo "Add columns properties one by one separated with spaces (name datatype if pk enter pk else don't enter anything)"
echo "Available datatypes boolean str int"
pkCounter=0
select i in "Add Column" "Done" "Delete";
do
    case $i in
    "Add Column")
        read -p "Add Column data : " name datatype pk
        
        if [ "$pk" = "pk" ] && [ "$pkCounter" -eq 0 ]; then
            pkCounter=$((pkCounter + 1))
            echo "$pk -,$name,$datatype" >> ./$1'_MetaData'
        elif [ "$pk" != "pk" ]; then
            echo "$pk -,$name,$datatype" >> ./$1'_MetaData'
        else 
            echo "Table should has one and only one pk column"
        fi

    ;;
    "Done")
        if [ "$pkCounter" -eq 0 ]; then
            echo "Table should has one and only one pk column"
        else 
            break
        fi
    ;;
    "Delete")
        rm ./$1'_MetaData'
        rm ./$1
        break
    ;;
    *)
    echo "Not valid option"
    esac
    echo "1) Add Column  2) Done  3) Delete"
done

