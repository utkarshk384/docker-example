```bash
nvm ls
nvm use node 19.4
npm install
npm run dev
```


```bash
# Create network
docker network create my-network

# Start postgres container
docker run \
		-e POSTGRES_PASSWORD=foobarbaz \
		-v pgdata:/var/lib/postgresql/data \
		-p 5432:5432 \
		--network my-network \
		--name db \
		-d \
		postgres:15.1-alpine

# Create docker image
docker build --pull -t api-node:1 ./api-node

# Run docker image
docker run \
    -d \
    -p 3000:3000 \
    -e DATABASE_URL=${DATABASE_URL} \
    --network my-network \
    --name api-node \
    api-node:1
```