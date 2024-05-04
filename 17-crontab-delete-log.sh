#!/bin/bash

# in home/ec2-user we need to add contab -e ---> One new file will be open and we need to add content 
# eg:  15 23 * * * /home/ec2-user/shell-script/17-crontab-delete-log.sh
# which indicates(Min Hours Date(1st-31st) Month day (sun, mon))
#In Above example we had give at 23:15 everyday run that crontab file indirectly 17-crontab-delete-log.sh got executing


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app_logs/


if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$G Souce Directory Exits $N"
else
    echo -e "$R Source Directory $SOURCE_DIRECTORY Doesnot Exits $N"
    exit 1
fi

GET_FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +5)

echo "Getting files: $GET_FILES"

while IFS= read -r LINE 
do
    echo "Removing $LINE file"
    rm -r $LINE

done <<< $GET_FILES