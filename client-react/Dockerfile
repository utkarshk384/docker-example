FROM node:19.4-bullseye-slim as build

# Set Working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Use cache mount to speed up install of existing dependencies
RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm install

# Copy all files from current directory to /app
COPY . .

# Build the app
RUN npm run build

# Setup runner
FROM nginxinc/nginx-unprivileged:1.23-alpine-perl

# Copy build files from build stage to nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

