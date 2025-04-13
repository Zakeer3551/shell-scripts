#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F:%r)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

# echo " script name: $0 " #$0 this special variable gives script name 


VALIDATE(){
    if [ $1 -ne 0 ] # $1, $2, these are arugments upto $n nth arguement we can give 
    then
        echo -e " ERROR: $2 is $R FAILED $N"
        exit 1
    else
        echo " $2 is $R SUCCESS $N"
fi
}

if [ $ID -gt 0 ]
then
    echo -e " $R ERROR: $N Please run this with root user "
    exit 1
else 
    echo -e " $G You are root user $N"
fi

yum install mysql -y  &>> $LOG_FILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOG_FILE

VALIDATE $? "Installing git"

yum install nginx -y &>> $LOG_FILE

VALIDATE $? "Installing nginx"
