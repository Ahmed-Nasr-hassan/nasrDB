#!/usr/bin/bash
echo "Add columns properties one by one (name datatype if pk enter pk)"

select i in "Add Column" "Done";
do
    case $i in
    "Add Column")
        read -p "Add Column data : " name datatype pk
        echo "$pk -,$name,$datatype" >> ./$1
    ;;
    "Done")
        break
    ;;
    *)
    echo "Not valid option"
    esac
    echo "1) Add Column  2) Done"
done

