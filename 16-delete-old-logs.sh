#!/bin/bash

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

GET_FILES=$(find $SOURCE_DIRECTORY -name "*.logs" -mtime +14)

echo ${GET_FILES}