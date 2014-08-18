FROM ubuntu:12.04
MAINTAINER Richard Acosta <richardhacosta@gmail.com>

RUN apt-get update -y
RUN apt-get install -y -q autoconf make gcc cpp patch python-dev git libtool default-jdk default-jdk-builddep default-jre gzip libghc-zlib-dev libcurl4-openssl-dev build-essential libsasl2-dev maven python-pip wget curl supervisor

###SSH and debug tools
RUN mkdir -p /var/run/sshd
RUN apt-get -y install openssh-server vim-gtk
RUN mkdir -p /root/.ssh
RUN echo 'root:screencast' |chpasswd
EXPOSE 22
###

ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
