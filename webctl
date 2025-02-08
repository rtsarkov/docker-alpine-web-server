#!/bin/bash

# Цветовые коды ANSI
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Функция для вывода справки
show_help() {
    echo -e "${CYAN}Usage:${RESET} $0 ${YELLOW}<service>${RESET} ${GREEN}<command>${RESET} [${BLUE}arguments...${RESET}]"
    echo ""
    echo -e "${CYAN}Manage services using Docker Compose.${RESET}"
    echo ""
    echo -e "${YELLOW}Available services:${RESET}"
    echo -e "  ${GREEN}php${RESET}        - PHP service commands"
    echo -e "  ${GREEN}nginx${RESET}      - Nginx service commands"
    echo -e "  ${GREEN}composer${RESET}   - Composer commands"
    echo -e "  ${GREEN}database${RESET}   - Database service commands"
    echo -e "  ${GREEN}apache2${RESET}    - Apache service commands"
    echo -e "  ${GREEN}clickhouse${RESET} - ClickHouse service commands"
    echo -e "  ${GREEN}elastic${RESET}    - Elasticsearch service commands"
    echo -e "  ${GREEN}kibana${RESET}     - Kibana service commands"
    echo -e "  ${GREEN}memcached${RESET}  - Memcached service commands"
    echo -e "  ${GREEN}sphinx${RESET}     - Sphinx service commands"
    echo ""
    echo -e "${YELLOW}Common commands:${RESET}"
    echo -e "  ${BLUE}up${RESET}         - Start services"
    echo -e "  ${BLUE}down${RESET}       - Stop services"
    echo -e "  ${BLUE}restart${RESET}    - Restart services"
    echo -e "  ${BLUE}logs${RESET}       - View service logs"
    echo -e "  ${BLUE}exec${RESET}       - Execute a command inside a running container"
    echo ""
    echo -e "${YELLOW}Examples:${RESET}"
    echo -e "  ${GREEN}$0 composer install${RESET}        # Run 'install' in Composer"
    echo -e "  ${GREEN}$0 php exec php -v${RESET}         # Execute 'php -v' inside PHP container"
    echo -e "  ${GREEN}$0 nginx restart${RESET}           # Restart Nginx service"
    echo -e "  ${GREEN}$0 up -d${RESET}                   # Start all services in detached mode"
    echo ""
    exit 0
}



# Проверяем, передан ли хотя бы один аргумент
if [ $# -lt 1 ]; then
    echo "Error: No arguments provided."
    echo "Try '$0 --help' for more information."
    exit 1
fi

# Если передан --help, показываем справку
if [[ "$1" == "--help" ]]; then
    show_help
fi

# Получаем первый аргумент
SERVICE=$1
shift

# Если передана общая команда Docker Compose без сервиса
if [[ "$SERVICE" =~ ^(up|down|restart|logs|ps)$ ]]; then
    docker compose "$SERVICE" "$@"
    exit 0
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
        echo "Error: Unknown service '$SERVICE'."
        echo "Try '$0 --help' for available services."
        exit 1
        ;;
esac