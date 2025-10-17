FROM payara/server-full:latest

RUN asadmin set-config-property --target=server-config cluster.enabled=false

COPY target/bank.war $DEPLOY_DIR
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
