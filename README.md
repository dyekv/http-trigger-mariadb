## HTTP REQUEST UDF MARIADB

[![pipeline status](https://gitlab.com/ktt/docker/http-trigger-mariadb/badges/master/pipeline.svg)](https://gitlab.com/ktt/docker/http-trigger-mariadb/badges/http-trigger-mariadb/commits/master)

- mysql-udf-http

```
docker pull registry.gitlab.com/ktt/docker/http-trigger-mariadb:latest
```


``` bash
mysql -u root -e "create function http_get returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
mysql -u root -e "create function http_post returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
mysql -u root -e "create function http_put returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD} && \
mysql -u root -e "create function http_delete returns string soname 'mysql-udf-http.so';" -p${MYSQL_ROOT_PASSWORD}
```
