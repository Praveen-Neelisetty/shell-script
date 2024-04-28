#!/bin/bash

USERID=$(id -u) #getting user id
TIMESTAMP=$(date +%F-%H-%M-%S) #getting date and time 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #getting the File/Script name
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log  #creating seperate log file for every new software installation
R="\e[31m" #Red Colour
G="\e[32m" #Green Colour
N="\e[30m" #Normal Colour

if [ $USERID -ne 0 ]
then
    echo "You are not Super User and Execution STOPPED"
    exit 1
else
    echo "You are Super User"
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILURE $N"
    else
        echo -e "$2 ...$G SUCCESS $N" 
    fi
}

dnf install mysql mysql-server -y &>>$LOGFILE
VALIDATE $? "MySQL Installation"

# if [ $? -eq 0 ]
# then
#     echo "MySQL Installation...SUCCESS"
# else
#     echo "MySQL Installation...FAILED"
# fi

dnf install git -y &>>$LOGFILE
VALIDATE $? "GIT Installation"

# if [ $? -eq 0 ]
# then
#     echo "GIT Installation...SUCCESS"
# else
#     echo "GIT Installation...FAILED"
# fi

echo "is Shell is running? YES"