#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


TIMESTAMP=$(date +%F:%r)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE (){
    if [ $1 -ne 0 ]
        then
        echo -e "$2 :: $R FAILED $N"
        else 
        echo -e "$2 :: $G SUCCESS $N"
    fi
}


if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run with root user $N"
    exit 1
    else 
    echo -e "$G You are root user $N"
fi



for package in $@
do 
    yum list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
        then
        yum install $package -y &>> $LOG_FILE
        VALIDATE $? "Installing of $package"
        else
        echo -e "$package is already installed :: $Y SKIPPING $N"
    fi
done





