FROM wegenenverkeer/base

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

CMD ["/sbin/my_init"]

RUN apt-get update &&\
    apt-get install software-properties-common -y &&\
    add-apt-repository ppa:webupd8team/java -y &&\
    apt-get update &&\
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections &&\
    apt-get install -y oracle-java8-installer &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
