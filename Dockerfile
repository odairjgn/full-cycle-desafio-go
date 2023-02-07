FROM golang:1.20.0-alpine3.17 AS builder

WORKDIR /home/hello
RUN go mod init example/hello
COPY ./go .
RUN go build

FROM scratch
WORKDIR /home
COPY --from=builder /home/hello/hello .
CMD ["./hello"]