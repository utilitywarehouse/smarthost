#!/bin/bash

read -p "Enter Recipient's Mail Server: " server
read -p "Enter SMTP Port: " port
read -p "Enter Your Email Address: " from
read -p "Enter Recipient's Email Address: " to

# create message
function mail_input {
echo "ehlo $(hostname -f)"
echo "MAIL FROM: <$from>"
echo "RCPT TO: <$to>"
echo "DATA"
echo "From: <$from>"
echo "To: <$to>"
echo "Subject: Testing SMTP Mail"
echo "test"
echo "."
echo "quit"
}

mail_input | netcat $server $port || err_exit 
