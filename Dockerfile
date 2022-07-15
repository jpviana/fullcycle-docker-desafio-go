FROM golang as builder

WORKDIR /usr/src/app

COPY . .

RUN go mod init hello && go build -o hello

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/ .

ENTRYPOINT ["./hello"]