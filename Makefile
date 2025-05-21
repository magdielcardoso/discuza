# Makefile para facilitar tarefas comuns de desenvolvimento no Discuza

# Nome da imagem Docker (baseado no deploy.yml.example)
IMAGE_NAME ?= magdielcardoso/discuza

.PHONY: help setup start dev test console c db_create db_migrate db_seed build dev_with_pg_docker docker

help:
	@echo "Comandos disponíveis:"
	@echo "  make help          - Mostra esta ajuda"
	@echo "  make setup         - Configura o ambiente de desenvolvimento inicial (roda script/setup)"
	@echo "  make credentials   - Abre o editor para configurar segredos de desenvolvimento (bin/rails credentials:edit)"
	@echo "  make start         - Inicia o servidor de desenvolvimento (./bin/dev)"
	@echo "  make dev           - Alias para make start"
	@echo "  make test          - Roda a suíte de testes (rails test)"
	@echo "  make console       - Abre o console Rails (rails c)"
	@echo "  make c             - Alias para make console"
	@echo "  make db_create     - Cria o banco de dados (rails db:create)"
	@echo "  make db_migrate    - Roda as migrações do banco (rails db:migrate)"
	@echo "  make db_seed       - Popula o banco de dados (rails db:seed)"
	@echo "  make build         - Constrói a imagem Docker localmente (docker build)"
	@echo "  make dev_with_pg_docker - Inicia o PostgreSQL (Docker) e o servidor de desenvolvimento"
	@echo "  make docker        - Constroi e empurra a imagem Docker para o Docker Hub"

setup:
	@echo "Setting up environment with bin/setup (without starting the server)..."
	@./bin/setup --skip-server
	@echo "\nEnvironment configured. To start the server, use: make start"
	@echo "Reminder: If it's your first time, run 'make credentials' to set up development secrets."

credentials:
	@echo "Opening editor for config/credentials.yml.enc..."
	@bin/rails credentials:edit

start: dev
dev:
	@echo "Iniciando servidor de desenvolvimento..."
	@./bin/dev

dev_with_pg_docker:
	@echo "Garantindo que o PostgreSQL (Docker) esteja em execução..."
	@./script/start_postgres_docker.sh
	@echo "Iniciando servidor de desenvolvimento..."
	@./bin/dev

test:
	@echo "Rodando testes..."
	@rails test

console: c
c:
	@echo "Abrindo console Rails..."
	@rails c

db_create:
	@echo "Criando banco de dados..."
	@rails db:create

db_migrate:
	@echo "Rodando migrações..."
	@rails db:migrate

db_seed:
	@echo "Populando banco de dados..."
	@rails db:seed

build:
	@echo "Construindo imagem Docker $(IMAGE_NAME)..."
	@docker build . -t $(IMAGE_NAME) 

# Build and push Docker image to Docker Hub
docker:
	@echo "Building Docker image magdielcardoso/space:latest using docker/Dockerfile..."
	@docker build -f docker/Dockerfile -t magdielcardoso/space:latest .
	@echo "Pushing Docker image to Docker Hub..."
	@docker push magdielcardoso/space:latest 