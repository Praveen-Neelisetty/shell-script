#!/bin/bash

#Learning Special Variables in Shell

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running this script: $USER"
echo "Hostname: $HOSTNAME"
echo "Process ID of the current shell script: $$" 
sleep 60 & #now i want process ID of this script which is running in background
echo "Process ID of last background command: $!"
echo "Exit status of the previous command: $?"