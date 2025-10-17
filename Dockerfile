FROM payara/server-full:latest

# Copy WAR to deployment directory
COPY target/bank.war $DEPLOY_DIR

# Copy start script
COPY start.sh /start.sh

# Expose port 8080
EXPOSE 8080

# Run start.sh via bash
CMD ["bash", "/start.sh"]
