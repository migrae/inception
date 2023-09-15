FROM alpine:3.17

RUN apk update \
		&& apk upgrade \
		&& apk add nginx \
		&& apk add openssl

ENV SSL_PATH /etc/nginx/ssl
# Create the directory for the SSL files
RUN mkdir -p $SSL_PATH

# Generate the private key
RUN openssl genpkey -algorithm RSA -out $SSL_PATH/mgraefen.key

# Generate a Certificate Signing Request (CSR)
RUN openssl req -new -key $SSL_PATH/mgraefen.key -out $SSL_PATH/mgraefen.csr -subj "/C=DE/ST=HN/O=42Heilbronn/OU=mgraefen/CN=mgraefen"

# Generate a self-signed certificate
RUN openssl x509 -req -days 365 -in $SSL_PATH/mgraefen.csr -signkey $SSL_PATH/mgraefen.key -out $SSL_PATH/mgraefen.crt

# Clean up the CSR as it's not needed after the certificate has been generated
RUN rm $SSL_PATH/mgraefen.csr

EXPOSE 443

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

