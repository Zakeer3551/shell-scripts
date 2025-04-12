#!/bin/bash

ID=$(id -u)


if [ $ID -gt 0 ]
then
    echo " ERROR: Please run this with root user "
else 
    echo " You are root user "
fi