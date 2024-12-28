FROM golang:1.19-bullseye AS Build

# Set working directory
WORKDIR /app

# Copy go mod and sum files
COPY . .

# Download all dependencies
RUN go mod download

# Compile application
RUN go build -o api-golang

# Set environment variables
ENV GIN_MODE=release

# Expose port
EXPOSE 8080

# Command to run the application
CMD ["./api-golang"]