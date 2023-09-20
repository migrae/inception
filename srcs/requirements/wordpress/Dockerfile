FROM alpine:3.17

RUN apk update \
		&& apk upgrade \
		&& apk add nginx \
		&& apk add openssl

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]

