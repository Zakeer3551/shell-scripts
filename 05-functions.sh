#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " ERROR: $2 is failed "
        exit 1
    else
        echo " $2 is successful"
fi
}

if [ $ID -gt 0 ]
then
    echo " ERROR: Please run this with root user "
    exit 1
else 
    echo " You are root user "
fi

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install git -y

VALIDATE $? "Installing git"

yum install nginx -y

VALIDATE $? "Installing nginx"
