.PHONY: build
build:
	make -C gateway build
	make -C greeter build

.PHONY: proto
proto:
	make -C gateway proto
	make -C greeter proto

.PHONY: clean
clean:
	make -C gateway clean
	make -C greeter clean
