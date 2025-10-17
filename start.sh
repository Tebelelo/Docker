#!/bin/bash
set -e

PORT=${PORT:-8080}

# Disable clustering offline (before domain start)
asadmin set-config-property --target=server-config cluster.enabled=false

# Set HTTP listener port offline
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

# Start Payara domain in foreground with verbose output
exec asadmin start-domain --verbose
