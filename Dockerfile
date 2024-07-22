# Use the official Tomcat image from the Docker Hub
FROM tomcat:9.0

USER root

# Remove the default webapps to keep the image clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Ensure necessary directories exist and have correct permissions
RUN chmod -R 777 /usr/local/tomcat

# Copy the WAR file to the Tomcat webapps directory with the context path as /mxplus
COPY mxplus.war /usr/local/tomcat/webapps/mxplus.war

# Copy the custom server.xml configuration file
COPY server.xml /usr/local/tomcat/conf/server.xml

# Expose HTTP and HTTPS ports
EXPOSE 8080 8443

# Start Tomcat
CMD ["catalina.sh", "run"]