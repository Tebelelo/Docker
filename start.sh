#!/bin/bash
set -e

PORT=${PORT:-8080}

asadmin set-config-property --target=server-config cluster.enabled=false
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

exec asadmin start-domain --verbose
