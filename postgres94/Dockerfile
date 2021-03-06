FROM phusion/baseimage:0.9.17

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

CMD ["/sbin/my_init"]

RUN apt-get update && \
    curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
    apt-get update && \
    apt-get -y -q install postgresql-9.4 postgresql-client-9.4 postgresql-9.4-postgis-2.1 postgis &&\
    mkdir -p /etc/service/postgresql &&\
    postgresql.sh /etc/service/postgresql/run &&\
    chmod a+x /etc/service/postgresql/run


# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.4`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -E UTF8 template_postgis2.1 --template template0 &&\
    psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis2.1'" &&\
    psql -d template_postgis2.1 -f /usr/share/postgresql/9.4/contrib/postgis-2.1/postgis.sql &&\
    #/usr/share/postgresql/9.4/extension/postgis--2.1.8.sql &&\
    psql -d template_postgis2.1 -c "GRANT ALL ON geometry_columns TO PUBLIC;" &&\ 
    psql -d template_postgis2.1 -c "GRANT ALL ON geography_columns TO PUBLIC;" &&\
    psql -d template_postgis2.1 -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;" &&\
    /etc/init.d/postgresql stop

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.4/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
#VOLUME	["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

USER root

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

