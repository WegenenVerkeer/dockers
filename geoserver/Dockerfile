FROM wegenenverkeer/postgres-tomcat7-java7

# We could use the following ADD commands instead if the RUN wget but due to flaky network connections in Vagrant,
# downloads get cut off with EOF error. wget is more forgiving, downloads don't interrupt
#ADD http://awvdocker.s3.amazonaws.com/docker/geoserver/geoserver.war /opt/tomcat7/webapps/geoserver.war
#ADD http://awvdocker.s3.amazonaws.com/docker/geoserver/geowebcache.war /opt/tomcat7/webapps/geowebcache.war
#ADD http://awvdocker.s3.amazonaws.com/docker/geoserver/geoserver-compact-2014-10-24.sql.gz /tmp/geoserver-compact-2014-10-24.sql.gz

RUN wget -O /opt/tomcat7/webapps/geoserver.war http://awvdocker.s3.amazonaws.com/docker/geoserver/geoserver.war
RUN wget -O /opt/tomcat7/webapps/geowebcache.war http://awvdocker.s3.amazonaws.com/docker/geoserver/geowebcache.war

USER root
RUN wget -O /tmp/geoserver-2014-10-28.sql.gz http://awvdocker.s3.amazonaws.com/docker/geoserver/geoserver-2014-10-28.sql.gz
RUN gunzip /tmp/geoserver-2014-10-28.sql.gz
RUN chown postgres /tmp/geoserver-2014-10-28.sql

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Adjust PostgreSQL configuration so that local connections to the
# database via geoserver user are possible.
RUN echo "local   all             all                                trust" > /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "host    all         all         127.0.0.1/32          trust" >>  /etc/postgresql/9.3/main/pg_hba.conf

# Create geoserver user & schema and import the geoserver data
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER geoserver WITH SUPERUSER PASSWORD 'geoserver';" &&\
    createdb -O geoserver geoserver &&\
    psql -U geoserver -f /tmp/geoserver-2014-10-28.sql geoserver 

USER root

# Create the tilecache dir
RUN mkdir /ont
RUN mkdir /ont/tilecache
RUN chmod 777 /ont/tilecache

# Start tomcat
RUN /opt/tomcat7/bin/startup.sh



