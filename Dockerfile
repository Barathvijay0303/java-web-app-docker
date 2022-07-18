FROM tomcat:10.0.21-jre11
# Dummy text to test 
COPY target/java-web-app-1.0.war /usr/local/tomcat/webapps/
