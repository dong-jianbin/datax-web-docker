FROM adoptopenjdk/openjdk8

WORKDIR /opt/
ADD ./clickhouse-keyring.gpg /opt/
ADD ./clickhouse.list /etc/apt/sources.list.d/

RUN apt-get update && \
apt-get install -y clickhouse-client && \
apt-get install -y mysql-server && \
apt-get install -y lftp && \
apt-get install -y vim && \
apt-get install -y python3 && \
apt-get install -y python3-pip && \
apt-get install -y libpq-dev python-dev && \
apt-get install -y freetds-dev freetds-bin && \
pip3 install --upgrade pip && \
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pymysql && \
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple psycopg2 && \
rm /usr/bin/python && \
ln -s /usr/bin/python3 /usr/bin/python


ADD ./datax.tar.gz /opt/
ADD ./datax-admin-2.1.2.jar /opt/
ADD ./datax-executor-2.1.2.jar /opt/


# 为了方便，预先在宿主机上生成key
#sudo apt-get install -y apt-transport-https ca-certificates dirmngr
#GNUPGHOME=$(mktemp -d)
#sudo GNUPGHOME="$GNUPGHOME" gpg --no-default-keyring --keyring /usr/share/keyrings/clickhouse-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8919F6BD2B48D754
#sudo rm -r "$GNUPGHOME"
#sudo chmod +r /usr/share/keyrings/clickhouse-keyring.gpg
#
#echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg] https://packages.clickhouse.com/deb stable main" | sudo tee \
#    /etc/apt/sources.list.d/clickhouse.list
