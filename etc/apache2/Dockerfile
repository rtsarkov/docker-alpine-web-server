FROM httpd:2.4
# ENV APACHE_RUN_USER=www
# ENV APACHE_RUN_GROUP=www
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj '/C=../ST=...../L=..../O=..../CN=...' -keyout ./server.key -out ./server.crt
