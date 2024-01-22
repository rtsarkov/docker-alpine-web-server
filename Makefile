include .env

php-exec:
	@docker exec -it ${APP_NAME}_phpfpm bash
 
db-exec:
	@docker exec -it ${APP_NAME}_database bash

rebuild:
	@docker-compose up -d --build

up:
	@docker-compose up -d $(s)

down:
	@docker-compose down $(s)

stop:
	@docker-compose stop $(s)

export_db:
	@/bin/bash import_db.sh
