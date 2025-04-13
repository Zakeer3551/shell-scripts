#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F:%r)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

# echo " script name: $0 " #$0 this special variable gives script name 


VALIDATE(){
    if [ $1 -ne 0 ]  
    then
        echo -e "ERROR: $2 is $R FAILED $N"
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N"
fi
}

if [ $ID -gt 0 ]
then
    echo -e "$R ERROR: $N Please run this with root user"
    exit 1
else 
    echo -e "$G You are root user $N"
fi

yum install mysql -y  &>> $LOG_FILE

VALIDATE $? "Installing MYSQL" # $1, $2, these are arugments which we are passing to up(line 15 validate function) 
#so there $1 = $? means ($? is the exit status of previous command (here in this case previous command is yum install mysql -y the exit status is 0 (0 means success)) 
# and $2 = "Installing MYSQL") so in line 17,20 - $2 comes like "Installing MYSQL" 
# so if we add one more thing after "Installing MYSQL" it will become 3rd arugment ($3 argument) and we call it in validate function as $3) 

yum install git -y &>> $LOG_FILE

VALIDATE $? "Installing git"

yum install nginx -y &>> $LOG_FILE

VALIDATE $? "Installing nginx"
