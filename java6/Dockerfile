FROM wegenenverkeer/base

#install java, accept license
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java6-installer

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
