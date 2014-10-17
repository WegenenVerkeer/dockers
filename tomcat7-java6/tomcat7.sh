#!/bin/sh
export JAVA_OPTS="-Dexternal.properties.file=/opt/tomcat7/app.properties -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled -Xmx2048m -Xms256m -XX:MaxPermSize=128M"
/opt/tomcat7/bin/catalina.sh run >>/var/log/catalina.out 2>&1
