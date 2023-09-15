FROM alpine:3.17
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    curl \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-openssl \
    php81-curl \
    php81-gd \
    php81-xml \
    php81-mbstring \
    php81-zip \
    php81-opcache
RUN mkdir -p /var/www/wordpress && cd /var/www/wordpress \
    && curl -O https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz --strip-components=1 \
    && rm latest.tar.gz

# Set the working directory to WordPress installation directory
WORKDIR /var/www/wordpress

# Adjust ownership and permissions for WordPress
RUN chown -R nobody:nobody . && \
    chmod 755 . && \
    find . -type f -exec chmod 644 {} \;

CMD ["php-fpm81", "-F"]
