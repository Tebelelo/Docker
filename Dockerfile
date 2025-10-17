FROM payara/server-full:latest

# Disable clustering at build time (optional, but let's keep runtime config in start.sh)
# You can remove this if you only want to do it at runtime
# RUN asadmin set-config-property --target=server-config cluster.enabled=false

# Copy your WAR file to the deployment directory
COPY target/bank.war $DEPLOY_DIR

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the port Payara will listen on
EXPOSE 8080

# Run your start script
CMD ["/start.sh"]
