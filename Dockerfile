FROM ubuntu:17.04
MAINTAINER RazzDazz

ENV REFRESHED_AT 2017-06-24
ENV DEBIAN_FRONTEND noninteractive

# Update packages, install apache, free diskspace
RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get --no-install-recommends -yqq install apache2 php5 libapache2-mod-php5 build-essential libgd2-xpm-dev && \
    rm -rf /var/lib/apt/lists/*
