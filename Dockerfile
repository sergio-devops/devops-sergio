# --- Etapa 1: build (compilación) ---
FROM golang:1.26 AS builder
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o server main.go

# --- Etapa 2: runtime (ejecución) ---
FROM alpine:3.20
WORKDIR /app

COPY --from=builder /app/server /app/server
COPY --from=builder /app/static /app/static

EXPOSE 8080
ENV PORT=8080
ENTRYPOINT ["/app/server"]