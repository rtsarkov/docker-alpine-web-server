include .env

#Перейти в контейнер php
php-exec:
	@docker exec -it ${APP_NAME}_phpfpm bash

#Перейти в контейнер бд
db-exec:
	@docker exec -it ${APP_NAME}_db bash

# Собрать/пересобрать образы
rebuild:
	@docker-compose up -d --build

# Запустить в фоновом режиме
up:
	@docker-compose up -d $(s)

# Остановить и удалить контейнеры, сети, тома и образы, созданные up
down:
	@docker-compose down $(s)

# Остановить текущие контейнеры
stop:
	@docker-compose stop $(s)

# Запустить импорт базы данных из файла в контейнер бд
import_dump_db:
	@/bin/bash import_db.sh

# Запустить синхронизацию файлов с удаленного сервера
sync_files:
	@/bin/bash sync-hosted-files.sh
