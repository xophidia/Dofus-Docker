FROM ubuntu:14.04
MAINTAINER xophidia <xophidia@gmail.com>

ENV MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql \
    HOME=/home

# Setup Ubuntu

RUN apt-get update && \
    apt-get install -y mono-complete unzip && \
    apt-get autoclean && apt-get --purge -y autoremove 


# Setup Symbioz emulateur c# Dofus 2.30

RUN cd $HOME && \
    apt-get -y install git && \
    git clone https://github.com/xophidia/Symbioz-for-Linux-Docker.git && \
    cd Symbioz-for-Linux-Docker/ && unzip SQL.zip


# Setup Mysql

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

ADD bdd /tmp/
ADD SQL_patch.sql /tmp/
RUN chmod +x /tmp/bdd
RUN /tmp/bdd

