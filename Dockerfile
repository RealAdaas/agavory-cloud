FROM golang:1.10 as builder
RUN go get github.com/codegangsta/negroni
RUN go get github.com/gorilla/mux github.com/xyproto/simpleredis
COPY main.go .
RUN go build main.go

FROM ubuntu

WORKDIR /app
COPY --from=builder /go/main guestbook
COPY public public

EXPOSE 3000
CMD ["./guestbook"]
