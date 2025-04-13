#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

VALIDATE $? "Installing MySQL"  # $1, $2, these are arugments which we are passing to up(line 15 validate function) 
#so there $1 = $? means ($? is the exit status of previous command (here in this case previous command is yum install mysql -y the exit status is 0 (0 means success)) 
# and $2 = "Installing MYSQL") so in line 17,20 - $2 comes like "Installing MYSQL" 
# so if we add one more thing after "Installing MYSQL" it will become 3rd arugment ($3 argument) and we call it in validate function as $3)

yum install git -y

VALIDATE $? "Installing GIT"