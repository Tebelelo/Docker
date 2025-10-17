#!/bin/bash
set -e

PORT=${PORT:-8080}

export AS_JAVA_OPTS="-Xmx512m -Xms256m -XX:MaxMetaspaceSize=128m -Dhz.network.rest-api.enabled=true"

asadmin set-config-property --target=server-config cluster.enabled=false
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

exec asadmin start-domain --verbose
