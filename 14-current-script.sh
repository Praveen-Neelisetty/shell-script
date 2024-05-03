#!/bin/bash

COURSE="DevOps from Current Script i-e 14-current-script"

echo "Before calling other script, course: $COURSE"
echo "PID which is there in  14-current-script.sh: $$"

./15-other-script.sh

echo "After calling other script, course: $COURSE"