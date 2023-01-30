# docker-alpine-web-server

Веб сервер для локальной разработки.
Включает в себя apache2, nginx, mysql, php-fpm+xdebug, mariadb, adminer
Все образы построены на базе alpine

### Запуск сборки фронтенда 
Если вам нужно собирать фронтенд, то в файле /etc/nodejs/entrypoint.sh укащаны команды которые будут запущены при старте образа, в dockerfile можно указать версию nodejs

### Сделать ssl сертификаты

В docker_compose.yaml в образе apache2 раскометировать `- ./certs:/usr/local/apache2/ssl`. 
На запущенном контейнере выполнить bash скрипт create_ssl.sh.

После чего остановить контейнер и расскоментировать `- "./etc/apache2/httpd-ssl.conf:/usr/local/apache2/conf/extra/httpd-ssl.conf"`

В конфиге /etc/apache2/httpd.conf расскоментировать следующие строки

```conf
# LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
# LoadModule ssl_module modules/mod_ssl.so
# Include /usr/local/apache2/conf/extra/httpd-ssl.conf`
```