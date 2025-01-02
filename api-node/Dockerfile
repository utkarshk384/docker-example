FROM node:19.4-bullseye-slim

# Create app directory
WORKDIR /app/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN --mount=type=cache,target=usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm ci --only=production

# Set environment variables
ENV NODE_ENV production

# Use non-root user
USER node

# Copy files
COPY --chown=node:node ./healthcheck/ .
COPY --chown=node:node ./src/ .

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]