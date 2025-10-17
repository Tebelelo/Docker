#!/bin/bash
set -e

# Use default port 8080 unless overridden by environment variable PORT
PORT=${PORT:-8080}

# Disable clustering and set HTTP listener port offline (domain must be stopped)
asadmin set-config-property --target=server-config cluster.enabled=false
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

# Start Payara domain in the foreground with verbose logging
exec asadmin start-domain --verbose
