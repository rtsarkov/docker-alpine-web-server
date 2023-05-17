FROM debian:buster

# Установка зависимостей
RUN apt-get update \
    && apt-get install -y wget

WORKDIR /
# Установка Sphinx
RUN wget -O sphinx.tar.gz https://sphinxsearch.com/files/sphinx-3.5.1-82c60cb-linux-amd64.tar.gz
RUN tar -xzf ./sphinx.tar.gz
RUN rm sphinx.tar.gz
RUN mv sphinx-3.5.1 /opt/sphinx

# Копирование конфигурационного файла Sphinx
#COPY ./sphinx.conf /opt/sphinx/etc/sphinx.conf


RUN wget http://sphinxsearch.com/files/dicts/ru.pak
RUN mkdir -p /opt/sphinx/dicst
RUN mv ru.pak /opt/sphinx/dicst/ru.pak

# Порты, которые необходимо открыть
EXPOSE 9306

# Запуск Sphinx
CMD ["/opt/sphinx/bin/searchd", "--nodetach"]
