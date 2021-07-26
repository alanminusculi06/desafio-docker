FROM golang:1.15-alpine as builder
 
WORKDIR /src/
COPY ./hello_world.go ./hello_world.go
RUN go build -ldflags "-w" hello_world.go \
    && chmod +x hello_world

FROM scratch

COPY --from=builder ./src/hello_world ./hello_world

ENTRYPOINT [ "./hello_world" ]