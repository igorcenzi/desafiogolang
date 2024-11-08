FROM golang:1.20 AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

CMD ["/fullcycle"]