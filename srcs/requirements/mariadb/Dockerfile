FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client openrc

# Configure OpenRC
RUN openrc && touch /run/openrc/softlevel

# Copy configuration and scripts
COPY conf/my.cnf /etc/my.cnf.d/my.cnf
COPY tools/mariadb_setup.sh /mariadb_setup.sh

# Set permissions
RUN chmod +x /mariadb_setup.sh
RUN mkdir -p tmp
# Expose MariaDB port
EXPOSE 3306

RUN /etc/init.d/mariadb setup
# Run the entrypoint script
ENTRYPOINT ["/mariadb_setup.sh"]
