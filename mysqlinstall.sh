#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then
echo permission denied
exit 1
fi
yum install mysql -y
if [ $? -ne 0 ]
then 
echo check there is fault
exit 1
else
echo installation is success
fi