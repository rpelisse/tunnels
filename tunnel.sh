#!/bin/bash

source ports.sh

echo "Starting tunnel to remote ${REMOTE_SERVER}..."
ssh -f -N -v -R ${REMOTE_SSH_PORT}:localhost:${LOCAL_SSH_PORT} \
                -R ${REMOTE_CLI_PORT}:localhost:${LOCAL_CLI_PORT} \
                -R ${REMOTE_DV_SQL_PORT}:localhost:${LOCAL_DV_SQL_PORT} \
		-R ${REMOTE_HTTP_PORT}:localhost:${LOCAL_HTTP_PORT} \
		-R ${REMOTE_MSSQL_PORT}:${MSSQL_SERVER}:${MSSQL_PORT} \
                "${REMOTE_USER}@${REMOTE_SERVER}"
echo 'Tunnel closed.'
