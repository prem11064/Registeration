# Use a base image with OpenJDK
FROM openjdk:11-jdk-slim

# Install Maven
RUN apt-get update && \
    apt-get install -y maven wget && \
    apt-get clean

# Install Tomcat with retry logic to handle download issues
RUN wget --tries=3 --retry-connrefused --waitretry=5 \
    https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz && \
    tar -xzf apache-tomcat-9.0.70.tar.gz && \
    mv apache-tomcat-9.0.70 /usr/local/tomcat && \
    rm apache-tomcat-9.0.70.tar.gz

# Install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update && \
    apt-get install -y jenkins && \
    apt-get clean

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV JENKINS_HOME=/var/lib/jenkins
ENV JENKINS_OPTS="--httpPort=8081"

# Expose the necessary ports
EXPOSE 8080 8081

# Start Tomcat and Jenkins
CMD ["sh", "-c", "/usr/local/tomcat/bin/catalina.sh run & java -jar /usr/share/jenkins/jenkins.war"]
