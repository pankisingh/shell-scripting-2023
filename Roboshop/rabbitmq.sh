#!/bin/bash

source common.sh

PRINT "Install ERLang"
yum list installed | grep erlang &>>$LOG
if [ $? -ne 0 ]; then
  yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y  &>>$LOG
fi
STAT_CHECK $?

PRINT "Setup RabbitMQ repos"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>$LOG
STAT_CHECK $?

PRINT "Install RabbitMQ Server"
yum install rabbitmq-server -y &>>$LOG
STAT_CHECK $?

PRINT "Start RabbitMQ Service"
systemctl enable rabbitmq-server &>>$LOG && systemctl start rabbitmq-server &>>$LOG
STAT_CHECK $?

PRINT "Create App User in RabbitMQ"
rabbitmqctl  list_users | grep roboshop &>>$LOG
if [ $? -ne 0 ]; then
  rabbitmqctl add_user roboshop roboshop123 &>>$LOG
fi
rabbitmqctl set_user_tags roboshop administrator &>>$LOG  && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$LOG
STAT_CHECK $?

