#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r LINE
do 
    USAGE=$(echo df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo df -hT | grep xfs | aws -F " " '{print $NF}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, current usag is: $USAGE /n"
    fi

done <<< $DISK_USAGE

echo "Message: $MESSAGE"

