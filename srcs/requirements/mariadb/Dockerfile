FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY conf/my.cnf /etc/my.cnf.d/my.cnf
RUN /etc/init.d/mariadb setup
COPY tools/mariadb_setup.sh /
RUN chmod +x mariadb_setup.sh
EXPOSE 3306
ENTRYPOINT ["/mariadb_setup.sh"]