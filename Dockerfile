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
    git clone https://github.com/Skinz3/Symbioz.git && \
    cd Symbioz && unzip SQL.zip


# Setup Mysql

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

ADD bdd /tmp/
RUN chmod +x /tmp/bdd
RUN /tmp/bdd

ENV force_color_prompt yes
