PROTO_DIR=proto

.PHONY: build
build:
	go build -o greeter-gw *.go

.PHONY: proto
proto:
	protoc -I=${PROTO_DIR}/hello -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway --swagger_out=logtostderr=true:${PROTO_DIR}/hello hello.proto && \
	protoc -I=${PROTO_DIR}/hello -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway --grpc-gateway_out=logtostderr=true:${PROTO_DIR}/hello hello.proto && \
	protoc -I=${PROTO_DIR}/hello -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis -I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway --go_out=plugins=grpc:${PROTO_DIR}/hello hello.proto

.PHONY: clean
clean:
	rm -f greeter-gw
