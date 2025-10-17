FROM payara/server-full:latest

# Copy the WAR file to the deployment directory
COPY target/bank.war $DEPLOY_DIR

# Copy the start script without chmod (we'll run it with bash)
COPY start.sh /start.sh

# Expose default Payara HTTP port
EXPOSE 8080

# Run the start.sh script using bash explicitly
CMD ["bash", "/start.sh"]
