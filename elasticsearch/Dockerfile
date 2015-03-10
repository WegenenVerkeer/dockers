FROM wegenenverkeer/java7

RUN apt-get update
RUN apt-get install -y wget curl

RUN cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.2.tar.gz && tar xvfz elasticsearch* && rm *tar.gz && mv elasticsearch* /opt
RUN ln -sf /opt/elasticsearch* /opt/elasticsearch

EXPOSE 9200
EXPOSE 9300


ENV ES_HOME /opt/elasticsearch

RUN mkdir -p /etc/service/elasticsearch
ADD elasticsearch.sh /etc/service/elasticsearch/run
RUN chmod a+x /etc/service/elasticsearch/run
