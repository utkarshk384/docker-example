DATABASE_URL:=postgres://postgres:foobarbaz@db:5432/postgres

.PHONY: run-postgres
run-postgres:
	@echo Starting postgres container
	-docker run \
		-e POSTGRES_PASSWORD=foobarbaz \
		-v pgdata:/var/lib/postgresql/data \
		-p 5432:5432 \
		--network my-network \
		--name db \
		-d \
		postgres:15.1-alpine

.PHONY: run-api-node
run-api-node:
	@echo Starting node api
	docker run \
		-e DATABASE_URL=${DATABASE_URL} \
		-d \
		-p 3000:3000 \
		--name api-node \
		--network my-network \
		api-node:1

.PHONY: run-api-golang
run-api-golang:
	@echo Starting golang api
	docker run \
		-e DATABASE_URL=${DATABASE_URL} \
		-d \
		-p 8080:8080 \
		--name api-golang \
		--network my-network \
		api-golang:1

.PHONY: run-client-react-dev
run-client-react-dev:
	@echo Starting react client
	cd client-react && \
		npm run dev

.PHONY: start-postgres
start-postgres:
	@echo Starting postgres container
	-docker start db

.PHONY: start-api-node
start-api-node:
	@echo Starting node api
	docker start api-node

.PHONY: start-api-golang
start-api-golang:
	@echo Starting golang api
	docker start api-golang

.PHONY: delete-all
delete-all:
	@echo Deleting all containers
	-docker rm -f db api-node api-golang