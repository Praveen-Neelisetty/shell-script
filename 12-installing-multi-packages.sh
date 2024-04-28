#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +F%-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1F}')
LOGFILE=/tmp/logs/SCRIPT_NAME-TIMESTAMP.log 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
}

if [ USERID -ne 0 ]
then
    echo -e "You are not Super User, Hence $R EXECUTION stopped $N"
    exit 1 
else
    echo "You are Super User"

for i in $@
do
    dnf list installed $i
    if [ $? -ne 0 ]
    then
        echo "$i Already Installed...$Y SKIPPING $N"
    else
        dnf install $i -y &>>LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done