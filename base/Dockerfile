FROM phusion/baseimage:0.9.15

# Set correct environment variables.
ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl zip unzip python2.7

