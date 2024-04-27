#!/bin/bash

#Check whether number is greater than or less than

read -p "Enter your Number: " NUM

echo "Entered number is: $NUM" 

if [$NUM -gt 10]
then
    echo "$NUM Number greater than 10"
else
    echo "$NUM Number lesser than 10"
fi
