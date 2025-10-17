#!/bin/bash
set -e

# Set default port if not provided by environment
PORT=${PORT:-8080}

# Limit JVM memory usage to avoid container OOM kills
export AS_JAVA_OPTS="-Xmx512m -Xms256m -XX:MaxMetaspaceSize=128m"

# Disable clustering offline (before domain start)
asadmin set-config-property --target=server-config cluster.enabled=false

# Set HTTP listener port offline
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

# Start Payara domain in the foreground with verbose output
exec asadmin start-domain --verbose
