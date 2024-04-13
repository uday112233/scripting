#!/bin/bash

DATE=$( date +%F )
LOGDIR=/home/ec2-user/msg.log
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$DATE-$SCRIPT_NAME.log
USERID=$( id -u )

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then 
echo not root
exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

for i in $@
do
yum list installed $i &>>$LOGFILE
if [ $? -ne 0 ]
then
echo $i is not installed
yum install $i -y &>>$LOGFILE
VALIDATE $? "$i"
else
echo $i already installed
fi
done