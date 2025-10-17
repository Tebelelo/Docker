FROM payara/server-full:latest

# Copy your WAR file
COPY target/bank.war $DEPLOY_DIR

# Copy start.sh from the same directory as Dockerfile
COPY start.sh /start.sh

# Make sure the start.sh file exists before chmod
RUN [ -f /start.sh ] && chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
