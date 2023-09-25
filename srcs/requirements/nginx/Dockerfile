FROM alpine:3.17

RUN apk update \
		&& apk upgrade \
		&& apk add nginx \
		&& apk add openssl

ENV SSL_PATH /etc/nginx/ssl

RUN mkdir -p $SSL_PATH
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out $SSL_PATH/mgraefen.crt \ 
        -keyout $SSL_PATH/mgraefen.key \
				-subj "/C=DE/ST=HN/O=42Heilbronn/OU=mgraefen/CN=mgraefen"

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

