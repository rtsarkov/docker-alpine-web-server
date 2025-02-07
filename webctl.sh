#!/bin/bash

# Проверяем, передан ли хотя бы один аргумент
if [ $# -lt 1 ]; then
    echo "Usage: $0 <service> <command> [arguments...]"
    echo "Available services: php, nginx, composer, database, apache2, clickhouse, clickhouse, kibana, memcached, sphinx"
    echo "Common commands: up, down, restart, logs, exec"
    echo "Examples:"
    echo "  $0 composer install"
    echo "  $0 php exec php -v"
    echo "  $0 nginx restart"
    echo "  $0 up -d"
    exit 1
fi

# Получаем первый аргумент
SERVICE=$1
shift

# Если передана общая команда Docker Compose без сервиса
if [[ "$SERVICE" =~ ^(up|down|restart|logs|ps)$ ]]; then
    docker compose "$SERVICE" "$@"
    exit 0
fi

# Проверяем, передан ли второй аргумент (команда для сервиса)
if [ $# -lt 1 ]; then
    echo "Missing command for service: $SERVICE"
    exit 1
fi

COMMAND=$1
shift

# Функция для выполнения общих команд с сервисом
run_common_command() {
    local service=$1
    local command=$2
    shift 2
    case $command in
        "up")
            docker compose up -d $service "$@"
            ;;
        "down")
            docker compose stop $service "$@"
            ;;
        "restart")
            docker compose restart $service "$@"
            ;;
        "logs")
            docker compose logs -f $service "$@"
            ;;
        "exec")
            docker compose exec $service "$@"
            ;;
        *)
            echo "Unknown command: $command"
            exit 1
            ;;
    esac
}

# Обработка команд для разных сервисов
case $SERVICE in
    "composer")
        docker compose run --rm composer "$COMMAND" "$@"
        ;;
    "php"|"nginx"|"database"|"apache2"|"clickhouse"|"elastic"|"kibana"|"memcached"|"sphinx")
        run_common_command $SERVICE "$COMMAND" "$@"
        ;;
    *)
        echo "Unknown service: $SERVICE"
        exit 1
        ;;
esac