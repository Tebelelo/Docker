#!/bin/bash
set -e

# Default to 8080 if PORT not set
PORT=${PORT:-8080}

# Update Payara HTTP listener to listen on $PORT
asadmin set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=$PORT

# Start domain in verbose mode
exec asadmin start-domain --verbose
