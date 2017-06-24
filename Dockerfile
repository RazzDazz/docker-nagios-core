FROM ubuntu:17.04
MAINTAINER RazzDazz
# Using instructions from 
# https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source.html#Ubuntu

ENV REFRESHED_AT 2017-06-24
ENV NAGIOS_SOURCE nagios-4.3.2.tar.gz
ENV DEBIAN_FRONTEND noninteractive

# Update packages, install apache, free diskspace
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and extract nagios sourcen
RUN cd /tmp && \
    wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/${NAGIOS_SOURCE}	 && \
    tar xzf nagioscore.tar.gz
    
# Compile
RUN cd /tmp/${NAGIOS_SOURCE}/ && \
    ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
    make all
