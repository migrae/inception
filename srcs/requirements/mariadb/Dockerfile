FROM alpine:3.17

RUN apk update \
		&& apk upgrade \
		&& apk add mariadb mariadb-client openrc

# Configure OpenRC
RUN openrc && touch /run/openrc/softlevel

# Copy configuration and scripts
COPY conf/my.cnf /etc/my.cnf.d/my.cnf
COPY tools/mariadb_setup.sh /mariadb_setup.sh

# Set permissions
RUN chmod +x /mariadb_setup.sh
RUN mkdir -p tmp

RUN /etc/init.d/mariadb setup
# Run the entrypoint script
ENTRYPOINT ["/mariadb_setup.sh"]
