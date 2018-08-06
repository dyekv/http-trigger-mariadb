FROM mariadb:10.3.8

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_USER     user
ENV MYSQL_PASSWORD password
ENV MYSQL_DATABASE app

RUN apt-get update && apt-get install make gcc pkg-config libcurl4-openssl-dev libmariadb-dev libmariadbclient18 unzip -y

COPY mysql-udf-http-master.zip /tmp


RUN cd /tmp && unzip mysql-udf-http-master.zip && cd mysql-udf-http-master && \
./configure  --prefix=/usr/lib/mysql/plugin --with-mysql=/usr/bin/mariadb_config && \
make && \
make install && \
ln -s /usr/lib/mysql/plugin/lib/mysql-udf-http.a /usr/lib/mysql/plugin/mysql-udf-http.a && \
ln -s /usr/lib/mysql/plugin/lib/mysql-udf-http.la /usr/lib/mysql/plugin/mysql-udf-http.la && \
ln -s /usr/lib/mysql/plugin/lib/mysql-udf-http.so /usr/lib/mysql/plugin/mysql-udf-http.so && \
rm -f /tmp/mysql-udf-http-master.zip

# RUN mysql -u root -e "create function http_get returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
# mysql -u root -e "create function http_post returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
# mysql -u root -e "create function http_put returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
# mysql -u root -e "create function http_delete returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD}

# RUN killall mysqld
