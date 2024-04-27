#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not Super User"
    exit 1
else
    echo "You are Super User"
fi

dnf install mysql 

if [ $? -ne 0 ]
then
    echo "MySQL installation FAILURE..."
    exit 1
else
    echo "MySQL installation SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "git installation FAILURE..."
    exit 1
else
    echo "git installation SUCCESS"
fi

echo "is shell scriting running? : YES"