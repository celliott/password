FROM golang:1.7.3 as builder
WORKDIR /go/src/github.com/celliott/password/
RUN go get -d -v github.com/gin-gonic/gin
COPY ./src .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o password .

FROM alpine:latest
RUN apk update && \
  apk add ca-certificates && \
  rm -rf /var/cache/apk/*

WORKDIR /root/
COPY --from=builder /go/src/github.com/celliott/password/password .

CMD ["./password"]
