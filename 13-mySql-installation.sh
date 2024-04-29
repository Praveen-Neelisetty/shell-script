#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(echo date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1F}')
#SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1F}')
LOGFILE=tmp/$(echo $1-$SCRIPT_NAME-$TIMESTAMP).log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e "You are not Super User, Hence $R Execution STOPPED $N"
    exit 1
else
    echo "You are super user"
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILED $N"
    else
        echo -e "$2 ...$G SUCCESS $N"
    fi
}

dnf install mysql-server -y &>>$LOGFILE "MySQL install"
VALIDATE $? "MySql Installation"

systemctl start mysql &>>$LOGFILE "MySQL start"
VALIDATE $? "Starting MySQL Server"

systemctl enable mysql &>>$LOGFILE "MySql Enable"
VALIDATE $? "Enabling MySQL Server"

mysql_secure_installation --set-root-pass ExpenseApp@1
VALIDATE $? "Setting up MySql Root Password"

echo -e "$G Installation $N and Setting $G Root Password $N completed"

