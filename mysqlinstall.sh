#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then
echo permission denied
exit 1
else
yum install mysql -y
fi