FROM wegenenverkeer/base

RUN mkdir -p /etc/service/mongodb
ADD mongodb.sh /etc/service/mongodb/run
RUN chmod a+x /etc/service/mongodb/run

ADD mongodb.conf /etc/

ENV MONGO_VERSION 2.0.4

RUN curl -SL "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz" -o mongo.tgz \
	&& tar -xvf mongo.tgz -C /usr/local \
	&& ln -s /usr/local/mongodb-linux-x86_64-$MONGO_VERSION /usr/local/mongo \
	&& rm mongo.tgz* \
	&& mkdir -p /data/db

VOLUME /data/db

EXPOSE 27017