FROM tomcat:10.0.21-jre11
# Dummy text to test 
COPY target/java-web-app*.war /usr/local/tomcat/webapps/
