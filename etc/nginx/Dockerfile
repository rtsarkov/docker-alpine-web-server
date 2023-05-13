FROM nginx:alpine

ARG version="1.4.1"

WORKDIR /app

RUN rm -rf /usr/share/nginx/html/*

RUN apk --no-cache add git curl wget go
RUN curl -L https://github.com/FiloSottile/mkcert/archive/v${version}.tar.gz | tar -xz

RUN cp mkcert-${version}/* /app
RUN CGO_ENABLED=0 go build -o /go/bin/mkcert
RUN /go/bin/mkcert -install

RUN mkdir -p /etc/nginx/certs && \
    /go/bin/mkcert -cert-file /etc/nginx/certs/localhost.crt -key-file /etc/nginx/certs/localhost.key localhost 127.0.0.1 ::1
