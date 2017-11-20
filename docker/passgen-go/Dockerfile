FROM golang:1.7.3
WORKDIR /go/src/github.com/celliott/passgengo/
RUN go get -d -v github.com/gin-gonic/gin
COPY ./src .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o passgengo .

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /root/
COPY --from=0 /go/src/github.com/celliott/passgengo/passgengo .

CMD ["./passgengo"]
