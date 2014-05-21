#!/bin/bash
source ports.sh

sudo /bin/systemctl stop  firewalld.service
sudo lokkit -q -p ${REMOTE_SSH_PORT}:tcp
sudo lokkit -q -p ${REMOTE_DV_SQL_PORT}:tcp
sudo lokkit -q -p ${REMOTE_CLI_PORT}:tcp
sudo lokkit -q -p ${REMOTE_MSSQL_PORT}:tcp
sudo /bin/systemctl start  firewalld.service
