#!/bin/bash

ID=$(id -u)


if [ $ID -gt 0 ]
then
    echo " ERROR: Please run this with root user "
    exit 1
else 
    echo " You are root user "
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo " ERROR: Installing is failed "
    exit 1
else
    echo " Installation is successful"
fi