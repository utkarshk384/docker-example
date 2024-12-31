FROM node:19.4-bullseye-slim as build

# Set Working directory
WORKDIR /app

# Copy all files from current directory to /app
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build

# Setup runner
FROM nginx:1.27-perl

# Copy build files from build stage to nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

