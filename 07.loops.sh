#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started excuting at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $2 failed $N"
        exit 1
    else
        echo -e "$2 ...$G success $N"
    fi
}

if [ $ID -ne 0 ]
    then 
        echo -e "$R ERROR : run with root access $N"
        exit 1
    else
        echo " you are root user"
fi 
    echo "all args are passed : $@"

for package in $@
do 
    yum list installed $package # if not installed

    if [ $? -ne 0 ]
     then 
        yum install $package -y
        VALIDATE $? "installation of $package "
    else
    echo -e "$package is already installed .... $Y SKIPPING $N"
fi
done



