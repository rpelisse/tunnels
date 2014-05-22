#!/bin/bash
source ports.sh

openTcpPort() {
  local port=${1}

  sudo lokkit --nostart -q -p ${port}:tcp
}

firewallOp() {
  local op=${1}

  sudo /bin/systemctl "${op}" firewalld.service
}

firewallOp stop
openTcpPort ${REMOTE_SSH_PORT}
openTcpPort ${REMOTE_DV_SQL_PORT}
openTcpPort ${REMOTE_CLI_PORT}
openTcpPort ${REMOTE_HTTP_PORT}
openTcpPort ${REMOTE_HTTP_CONSOLE_PORT}
openTcpPort ${REMOTE_MSSQL_PORT}
openTcpPort ${REMOTE_MSSQL_DEV_PORT}
openTcpPort ${REMOTE_SAS_PORT}
openTcpPort ${REMOTE_LDAP_PORT}
openTcpPort ${REMOTE_DB2_PORT}
openTcpPort ${REMOTE_ORACLE_PORT}
openTcpPort ${REMOTE_ORACLE_PROD_PORT}
firewallOp start
