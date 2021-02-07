FROM tomcat:8-jdk8-corretto
COPY target/webapp.war /usr/local/tomcat/webaps/webapp.war
