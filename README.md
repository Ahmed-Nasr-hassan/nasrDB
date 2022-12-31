# DBMS Bash Project

## Project Description

The Project aim to develop DBMS, that will enable users to store and retrieve the data from Hard-disk.

The Project Features:
The Application will be CLI Menu based app, that will provide to user this Menu items:
Main Menu:

- Create Database
- List Databases
- Connect To Databases
- Drop Database

Upon user Connect to Specific Database, there will be new Screen with this Menu:

- Create Table
- List Tables
- Drop Table
- Insert into Table
- Select From Table
- Delete From Table
- Update Table

- The Database will store as Directory on Current Script File
- The Select of Rows displayed in screen/terminal in  an Accepted/Good Format
- Ask about columns datatypes in create table and check on them in both insert and update
- Ask about primary key in create table and check for it in the insert into table

## Project Structure

### nasrDB

- createDB.sh

  - checkRegex.sh
  
- listDB.sh

- connectDB.sh

  - checkRegex.sh
  - tableMenu.sh

- dropDB.sh

  - checkRegex.sh

### tableMenu.sh

- createTable.sh
  - checkRegex.sh
  - askForColumnsData.sh

- listTables.sh

- dropTable.sh
  - checkRegex.sh

- insertIntoTable.sh
  - askForRowsData.sh
    - check.sh
        1. checkUniquePk.sh
        2. checkEachValueType.sh
          - getValueType.sh

- selectFromTable.sh
    1. checkColumnsAndWhere.sh
    - checkColumns.sh
    - checkWhere.sh
      - getColumnType.sh

    2. selectData.sh
    - Data filtering commands

- deleteFromTable.sh
  - checkWhere.sh
    - getColumnType.sh
  - deleteData.sh
    - Data filtering commands

- updateTable.sh
  - checkNewValueAndWhere.sh
    1. checkWhere.sh
        - getColumnType.sh
    2. checkColToNewValue.sh
        - getValueType.sh
        - getColumnType.sh
  - updateData.sh
    - getColumnsIndexes.sh
    - Data filtering commands

### Data filtering commands

- selectDataEqual.sh
- selectDataNotEqual.sh
- selectDataGreaterThan.sh
- selectDataGreaterThanAndEqual.sh
- selectDataSmallerThan.sh
- selectDataSmallerThanAndEqual.sh



