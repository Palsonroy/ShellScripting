#!/bin/bash

SOURCE_DIR="/tmp/shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d SOURCE_DIR ]
then
    echo -e "$R source_dir : $SOURCE_DIR doesnt exit.$N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line 
do
     echo "deleting : $line"

done <<< $FILES_TO_DELETE

