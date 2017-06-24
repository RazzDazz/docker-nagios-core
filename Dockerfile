FROM ubuntu:17.04
MAINTAINER RazzDazz
# Using instructions from 
# https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source.html#Ubuntu

ENV REFRESHED_AT 2017-06-24
ENV NAGIOS_CORE_TAR nagios-4.3.2.tar.gz
ENV NAGIOS_CORE_DIR nagioscore-nagios-4.3.2
ENV DEBIAN_FRONTEND noninteractive

# Update packages, install apache, free diskspace
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get -yqq install \
        apache2 \
        autoconf \
        gcc \
        libapache2-mod-php7.0 \
        libc6 \
        libgd2-xpm-dev \
        make \
        php \
        unzip \
        wget && \
    rm -rf /var/lib/apt/lists/*

# Download and extract nagios sourcen
RUN mkdir -p /tmp/nagios && \
    cd /tmp/nagios/ && \
    wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/${NAGIOS_CORE_TAR}	 && \
    tar zxvf nagioscore.tar.gz && \
    rm -f nagioscore.tar.gz
    
# Compile
RUN cd /tmp/nagios/${NAGIOS_CORE_DIR}/
RUN ./configure --with-httpd-conf=/etc/apache2/sites-enabled
RUN make all

# run shell to keep container alive for testing
CMD  /bin/bash
