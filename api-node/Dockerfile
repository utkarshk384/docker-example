FROM node:19.4-bullseye-slim

# Create app directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Set environment variables
ENV NODE_ENV production

# Start the app
CMD ["node", "src/index.js"]