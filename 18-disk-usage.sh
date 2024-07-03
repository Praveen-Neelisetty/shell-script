#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r LINE
do 
    USAGE=$(echo $LINE | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $LINE | aws -F " " '{print $NF}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, current usage is: $USAGE \n"
    fi

done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" info@joindevops.com

# echo "body" | mail -s "subject" to-address