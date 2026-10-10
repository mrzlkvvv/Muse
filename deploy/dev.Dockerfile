FROM golang:1-alpine

WORKDIR /app

# Install air (hot-reload)
RUN go install github.com/air-verse/air@latest

# Installing dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copying sources
COPY . .

# Run with hot-reload
EXPOSE 8080
ENTRYPOINT [ "air" ]
