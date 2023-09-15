FROM alpine:3.17

RUN apk update \
		&& apk upgrade \
		&& apk add nginx \
		&& apk add openssl

ENV SSL_PATH /etc/nginx/ssl
# Create the directory for the SSL files
RUN mkdir -p $SSL_PATH
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out $SSL_PATH/mgraefen.crt \ 
        -keyout $SSL_PATH/fsandel.key \
				-subj "/C=DE/ST=HN/O=42Heilbronn/OU=mgraefen/CN=mgraefen"

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# # Clean up the CSR as it's not needed after the certificate has been generated
# RUN rm $SSL_PATH/mgraefen.csr

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

