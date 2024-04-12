#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE="/tmp/$SCRIPT_NAME-$DATE.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... ${R}FAILURE${N}"
        exit 1
    else
        echo -e "$2 ... ${G}SUCCESS${N}"
    fi
}

# Check if the user is running with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: Please run this script with root privileges"
    exit 1
fi

# Install MySQL
yum install mariadb-server -y &>>"$LOGFILE"
VALIDATE $? "Installing MySQL"

# Install Postfix
yum install postfix -y &>>"$LOGFILE"
VALIDATE $? "Installing Postfix"
