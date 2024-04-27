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
else
    echo "MySQL installation SUCCESS"
fi

echo "is shell scriting running?"