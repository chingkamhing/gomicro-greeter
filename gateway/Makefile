PROTO_DIR=srv/proto

.PHONY: build
build:
	go build -o greeter-gw *.go

.PHONY: proto
proto:
	protoc -I=${PROTO_DIR}/hello --micro_out=paths=source_relative:${PROTO_DIR}/hello --go_out=${PROTO_DIR}/hello hello.proto

.PHONY: clean
clean:
	rm -f greeter-gw
