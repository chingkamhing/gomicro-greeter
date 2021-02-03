PROTO_DIR=srv/proto

.PHONY: build
build:
	go build -o greeter-srv srv/*.go
	go build -o greeter-cli cli/*.go
	go build -o greeter-sc cli/sidecar/*.go

.PHONY: proto
proto:
	protoc -I=${PROTO_DIR}/hello --micro_out=paths=source_relative:${PROTO_DIR}/hello --go_out=${PROTO_DIR}/hello hello.proto

.PHONY: clean
clean:
	rm -f ${PROTO_DIR}/hello/*.pb.go
	rm -f ${PROTO_DIR}/hello/*.pb.micro.go
	rm -f greeter-srv
