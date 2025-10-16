FROM payara/server-full:latest

# Copy the WAR file from the target directory
COPY target/bank.war $DEPLOY_DIR

EXPOSE 8080

CMD ["asadmin", "start-domain", "--verbose"]
