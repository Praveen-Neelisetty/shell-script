#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app_logs

if [ -d SOURCE_DIRECTORY ]
then
    echo "$G Souce Directory Exits $N"
else
    echo "$R Source Directory Doesnot Exits $N"
fi

GET_FILES=echo "find $SOURCE_DIRECTORY -name "*.logs" -mtime +14"

