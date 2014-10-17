FROM wegenenverkeer/base

RUN mkdir -p /etc/service/mongodb
ADD mongodb.sh /etc/service/mongodb/run
RUN chmod a+x /etc/service/mongodb/run

RUN apt-get update
RUN apt-get install -y mongodb
#make sure we listen to all ports, not just localhost
RUN sed -i.bak s/"bind_ip = 127.0.0.1"/"bind_ip = 0.0.0.0"/g /etc/mongodb.conf

RUN mkdir -p /data/db

EXPOSE 27017
