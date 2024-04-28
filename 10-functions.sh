#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]
then
    echo "You are not Super User"
else
    echo "You are Super User"
fi

dnf install mysql mysql-server -y

if [ $? -eq 0 ]
then
    echo "MySQL Installation...SUCCESS"
else
    echo "MySQL Installation...FAILED"
fi

dnf install git -y

if [ $? -eq 0 ]
then
    echo "GIT Installation...SUCCESS"
else
    echo "GIT Installation...FAILED"
fi

echo "is Shell is running? YES"
