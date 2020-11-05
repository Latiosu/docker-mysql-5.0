FROM ubuntu:12.04

ARG uid=1001
ARG gid=1001

RUN apt-get update && \
    apt-get -y --no-install-recommends install ca-certificates wget && \
    wget https://cdn.mysql.com/archives/mysql-5.0/mysql-standard-5.0.15-linux-x86_64-glibc23.tar.gz -O mysql.tar.gz && \
    mkdir -p /mysql && \
    tar -xzf mysql.tar.gz --no-same-owner -C /mysql --strip-components=1 && \
    apt-get -y remove wget && \
    apt-get -y autoremove && \
    apt-get clean

RUN addgroup --gid $gid --system mysql \
    && adduser --uid $uid --disabled-password --system --gid $gid mysql

COPY my.cnf /etc/

COPY entrypoint.sh /mysql
ENTRYPOINT ["/mysql/entrypoint.sh"]

EXPOSE 3306
WORKDIR /mysql
CMD ["/mysql/bin/mysqld_safe", "--user=mysql"]
