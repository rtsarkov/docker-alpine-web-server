#!/bin/bash

# Указать путь к файлу .env
ENV_FILE="$PWD/.env"
DUMP_FILE="$PWD/dump.sql"

# Проверить, существует ли файл .env
if [ -f "$ENV_FILE" ]; then
  # Загрузить переменные из файла .env
  . "$ENV_FILE"
else
  echo "Файл $ENV_FILE не найден."
  exit 1
fi

if [ -f "$DUMP_FILE" ]; then
	echo "Начало импорта"
	cat dump.sql | docker exec -i "$APP_NAME"_db mysql -h database -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"
	echo "Импорт завершен"
else
  echo "Файл $DUMP_FILE не найден."
  exit 1
fi