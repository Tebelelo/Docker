# Use Payara Full Server base image
FROM payara/server-full:latest

# Disable Hazelcast clustering to avoid noisy logs and unnecessary attempts to join a cluster
RUN asadmin set-config-property --target=server-config cluster.enabled=false

# Copy your WAR file into Payara's autodeploy directory
COPY target/bank.war $DEPLOY_DIR

# Expose the default Payara port
EXPOSE 8080

# Start the domain in verbose mode
CMD ["asadmin", "start-domain", "--verbose"]
