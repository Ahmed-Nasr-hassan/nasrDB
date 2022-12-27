#!/usr/bin/bash
if [ "$1" -eq "$1" ] 2>/dev/null ; then
    currentInputType="int"
elif [ "$1" = "true" ] || [ "$1" = "false" ]; then
    currentInputType="boolean"
else
    currentInputType="str"
fi
echo $currentInputType