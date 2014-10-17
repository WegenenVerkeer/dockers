FROM wegenenverkeer/java7

RUN mkdir -p /etc/service/tomcat7
ADD tomcat7.sh /etc/service/tomcat7/run
RUN chmod a+x /etc/service/tomcat7/run

RUN cd /tmp && wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz && tar xvfz apache* && rm *tar.gz && mv apache* /opt
RUN ln -sf /opt/apache-tomcat* /opt/tomcat7

EXPOSE 8080
