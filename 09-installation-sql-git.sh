#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not Super User"
else
    echo "You are Super User"
fi

dnf install mysql

echo "is shell scriting running?"