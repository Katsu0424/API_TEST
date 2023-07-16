FROM mysql:8.0

COPY my.cnf /tmp/my.cnf

RUN chmod 644 /tmp/my.cnf && chown root:root /tmp/my.cnf

RUN mv /tmp/my.cnf /etc/mysql/conf.d/my.cnf

COPY init.sql /docker-entrypoint-initdb.d/init.sql