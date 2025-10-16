# Use the official Payara Server Full image
FROM payara/server-full:latest

# Optional: Set environment variables (e.g., for admin or memory tuning)
ENV PAYARA_HOME /opt/payara
ENV DEPLOY_DIR ${PAYARA_HOME}/glassfish/domains/domain1/autodeploy

# Copy your WAR file into the auto-deploy folder
COPY target/bank.war ${DEPLOY_DIR}/

# Expose the default HTTP port
EXPOSE 8080

# Start Payara in the foreground
CMD ["asadmin", "start-domain", "-v"]
