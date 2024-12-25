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

.PHONY: run-api-node-dev
run-api-node-dev:
	@echo Starting node api
	cd api-node && \
		DATABASE_URL=${DATABASE_URL} \
		npm run dev

.PHONY: run-api-golang-dev
run-api-golang-dev:
	@echo Starting golang api
	cd api-golang && \
		DATABASE_URL=${DATABASE_URL} \
		go run main.go

.PHONY: run-client-react-dev
run-client-react-dev:
	@echo Starting react client
	cd client-react && \
		npm run dev

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