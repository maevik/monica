.PHONY: all proto node server clean

all: proto node server

proto:
	protoc --proto_path=proto \
		--go_out=proto --go_opt=paths=source_relative \
		--go-grpc_out=proto --go-grpc_opt=paths=source_relative \
		proto/*.proto

node:
	cd node && go build -o ../build/node .

server:
	cd server && go build -o ../build/server .

clean:
	rm -rf build
