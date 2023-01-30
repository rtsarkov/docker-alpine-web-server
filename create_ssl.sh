#!/bin/sh

docker exec docker_apache2 bash -c 'cd /usr/local/apache2/ && openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj '/C=../ST=...../L=..../O=..../CN=...' -keyout ./ssl/server.key -out ./ssl/server.crt'