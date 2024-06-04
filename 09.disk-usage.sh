#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|file')
DISK_TRESHOLD=1
message=""

while IFS= read line
do 
    usage=$(echo $line | awk '{print $6f}' | cut -d % -f1)
    Partition=$(echo $line | awk '{print $1f}')
    if [ $usage -ge $DISK_TRESHOLD ]
    then
        message+="High disk usage on $Partition: $usage"
    fi
done <<< $DISK_USAGE

echo "message: $message"