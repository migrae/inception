FROM alpine:3.17

RUN apk update \
		&& apk upgrade 
RUN apk --no-cache add php81 php81-fpm php81-mysqli php81-json php81-openssl php81-curl \
    php81-zlib php81-xml php81-phar php81-intl php81-dom php81-xmlreader php81-ctype \
    php81-mbstring php81-gd php81-session php81-tokenizer wget mariadb-client

WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli
RUN wp-cli core download

COPY conf/wp-config.php /var/www/wordpress
COPY tools/edit_fm_conf.sh .
COPY tools/setup_wordpress.sh /usr/bin/
RUN chmod +x edit_fm_conf.sh && ./edit_fm_conf.sh
RUN chmod +x /usr/bin/setup_wordpress.sh

EXPOSE 9000

CMD ["/usr/bin/setup_wordpress.sh"]

