FROM golang:latest AS builder

WORKDIR /app

COPY main.go .

ENV GO111MODULE=off

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o main .

FROM scratch

COPY --from=builder /app/main /app/main

CMD ["/app/main"]
