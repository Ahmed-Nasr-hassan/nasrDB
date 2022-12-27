startWithNumber=$(echo $1 | grep '^[0-9]')
containsRegex=$(echo $1 | grep '[^A-Za-z0-9]')

if [[ -z "$startWithNumber" && -z "$containsRegex" ]]; then
    echo 1
else
    echo 0
fi

