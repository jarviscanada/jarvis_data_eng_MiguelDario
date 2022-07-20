#! /bin/sh

cmd=$1
db_username=$2
db_password=$3

sudo systemctl status docker || sudo systemctl start docker

container_status=$?








