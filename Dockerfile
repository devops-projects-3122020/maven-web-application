FROM tomcat:8-jdk8-corretto
COPY target/maven-web-application.war /usr/local/tomcat/webaps/webapp.war
