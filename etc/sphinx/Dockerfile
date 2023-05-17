FROM --platform=linux/amd64 debian:buster

# Установка зависимостей
RUN apt-get update \
    && apt-get install -y wget sphinxsearch

#WORKDIR /
# Установка Sphinx
#RUN wget -O sphinx.tar.gz https://sphinxsearch.com/files/sphinx-3.5.1-82c60cb-linux-amd64.tar.gz
#RUN tar -xzf ./sphinx.tar.gz
#RUN rm sphinx.tar.gz
#RUN mv sphinx-3.5.1 /opt/sphinx
#RUN wget http://sphinxsearch.com/files/dicts/ru.pak
#RUN mkdir -p /opt/sphinx/dicst
#RUN mv ru.pak /opt/sphinx/dicst/ru.pak
#
## Копирование конфигурационного файла Sphinx
RUN echo 'START=yes' > /etc/default/sphinxsearch
COPY ./sphinx.conf /etc/sphinxsearch/sphinx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY wordforms.txt /etc/sphinxsearch/wordforms.txt
#
#

#
## Запуск Sphinx
#CMD ["searchd", "--nodetach"]
CMD ["/start.sh"]