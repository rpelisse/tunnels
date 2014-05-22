#!/bin/bash
readonly DRY_RUN=${1}

source ports.sh

if [ -n ${DRY_RUN} ]; then
  dry_run_mode='echo'
fi

echo "Starting tunnel to remote ${REMOTE_SERVER}..."
${dry_run_mode} ssh -f -N -v -R ${REMOTE_SSH_PORT}:localhost:${LOCAL_SSH_PORT} \
                -R ${REMOTE_CLI_PORT}:localhost:${LOCAL_CLI_PORT} \
                -R ${REMOTE_DV_SQL_PORT}:localhost:${LOCAL_DV_SQL_PORT} \
                -R ${REMOTE_HTTP_PORT}:localhost:${LOCAL_HTTP_PORT} \
                -R ${REMOTE_HTTP_CONSOLE_PORT}:localhost:${LOCAL_HTTP_CONSOLE_PORT} \
                -R ${REMOTE_MSSQL_PORT}:${MSSQL_SERVER}:${MSSQL_PORT} \
                -R ${REMOTE_MSSQL_DEV_PORT}:${MSSQL_SERVER_DEV}:${MSSQL_DEV_PORT} \
                -R ${REMOTE_ORACLE_PORT}:${ORACLE_SERVER}:${ORACLE_PORT} \
                -R ${REMOTE_ORACLE_PROD_PORT}:${ORACLE_PROD_SERVER}:${ORACLE_PROD_PORT} \
                -R ${REMOTE_DB2_PORT}:${DB2_SERVER}:${DB2_PORT} \
                -R ${REMOTE_SAS_PORT}:${SAS_SERVER}:${SAS_PORT} \
                -R ${REMOTE_LDAP_PORT}:${LDAP_SERVER}:${LDAP_PORT} \
                "${REMOTE_USER}@${REMOTE_SERVER}"
echo 'Tunnel closed.'
