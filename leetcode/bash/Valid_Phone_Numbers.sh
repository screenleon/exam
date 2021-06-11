#! /bin/bash

while read y
do
    # '\d' and '\s' is not used for base regex
    if [[ $y =~ ^((\([0-9]{3}\)\ )|([0-9]{3}-))[0-9]{3}-[0-9]{4}$ ]]; then
        echo $y
    fi
done < test.txt
