#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not Super User"
else
    echo "You are Super User"
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 ...SUCCESS"
    else
        echo "$2 ...FAILURE" 
    fi
}

dnf install mysql mysql-server -y
VALIDATE $? "MySQL Installation"

# if [ $? -eq 0 ]
# then
#     echo "MySQL Installation...SUCCESS"
# else
#     echo "MySQL Installation...FAILED"
# fi

dnf install git -y
VALIDATE $? "GIT Installation"

# if [ $? -eq 0 ]
# then
#     echo "GIT Installation...SUCCESS"
# else
#     echo "GIT Installation...FAILED"
# fi

echo "is Shell is running? YES"
