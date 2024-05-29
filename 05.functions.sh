#!/bin/bash

ID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "ERROR: $2... failed"
    exit 1
else
    echo "$2... success"
fi

}

if [ $ID -ne 0]

    echo "ERROR: please run this script with root access"
    exit 1
else
    echo "you are root"
fi

yum install mysql -y 

VALIDATE $? "Instaling mysql"


yum install git -y



