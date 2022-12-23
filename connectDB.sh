#!/usr/bin/bash
function tableMenuFun {

    tableMenu=('Create Table' 'List Tables' 'Drop Table' 'Insert into Table' 'Select From Table' 'Delete From Table' 'Update Table' 'Back')

    select i in "${tableMenu[@]}";
    do
        case $i in
        'Create Table')
            createTable.sh
        ;;
        'List Tables')
            listTables.sh
        ;;
        'Drop Table') 
            dropTable.sh
        ;;
        'Insert into Table')
            insertIntoTable.sh
        ;;
        'Select From Table')
            selectFromTable.sh
        ;;
        'Delete From Table')
            deleteFromTable.sh
        ;;
        'Update Table')
            updateTable.sh
        ;;
        'Back')
            break
        ;;
        *)
        echo "Not valid option"
        esac

    done
}

read -p "Enter Database name : " name
if [ -e $name ]; then
    echo "Connected to $name"
    cd $name
    tableMenuFun
else 
    echo "No database with name : $name"
fi

