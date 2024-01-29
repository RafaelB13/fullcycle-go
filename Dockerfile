FROM golang:alpine as builder

WORKDIR /app

COPY main.go go.mod ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ./cmd/fullcycle-go

FROM scratch

WORKDIR /app

COPY --from=builder /app/cmd/fullcycle-go .

CMD ["./fullcycle-go"]