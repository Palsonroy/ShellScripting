#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "ERROR : its not a root user"
    exit 1
else
    echo "its  a root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "installation failed"
    exit 1
else
    echo "installation success"
fi