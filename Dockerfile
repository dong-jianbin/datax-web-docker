FROM adoptopenjdk/openjdk8:jdk8u-centos-nightly

ADD ./clickhouse.repo /etc/yum.repos.d/

RUN yum install -y vim && \
    yum install -y mysql && \
    yum install -y python3 && \
    yum install -y openssl && \
    yum install -y openssh-server && \
    yum install -y openssh* && \
#    yum install -y clickhouse-client && \
    rm /usr/bin/python && \
    ln -s /usr/bin/python3.6 /usr/bin/python

ENV TIME_ZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime

WORKDIR /opt/
ADD ./datax.tar.gz /opt/
ADD ./datax-admin-2.1.2.jar /opt/
ADD ./datax-executor-2.1.2.jar /opt/
