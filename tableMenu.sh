#!/usr/bin/bash
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
    echo '1) Create Table' '2) List Tables' '3) Drop Table' '4) Insert into Table' '5) Select From Table' '6) Delete From Table' '7) Update Table' '8) Back'
done