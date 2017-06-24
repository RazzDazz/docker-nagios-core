FROM ubuntu:17.04
MAINTAINER RazzDazz

ENV REFRESHED_AT 2017-06-24
ENV NAGIOS_SOURCE nagios-4.1.1.tar.gz
ENV DEBIAN_FRONTEND noninteractive

# Update packages, install apache, free diskspace
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get --no-install-recommends -yqq install apache2 php5 libapache2-mod-php5 build-essential libgd2-xpm-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and extract nagios sourcen
RUN cd /tmp && \
    wget http://prdownloads.sourceforge.net/sourceforge/nagios/${NAGIOS_SOURCE} && \
    tar zxvf nagios-4.1.1.tar.gz
