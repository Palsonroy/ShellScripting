#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "its a root user"
else
    echo "its  not a root user"
fi

yum install mySQL -y