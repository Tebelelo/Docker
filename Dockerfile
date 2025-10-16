FROM payara/server-full:latest
 
# Copy the WAR file into the autodeploy directory
COPY bank.war $DEPLOY_DIR
 
# Expose the port Payara uses (default is 8080)
EXPOSE 8080
 
# Start Payara in verbose mode
CMD ["asadmin", "start-domain", "--verbose"]
