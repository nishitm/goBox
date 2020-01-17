.PHONY: install 
install: go.sum
	go get -v -t

.PHONY: build 
build: install
	go build -o gobox 

.PHONY: test
test: build
	go test	

.PHONY: dist
dist:
	env GOOS=linux GOARCH=amd64 go build -o ./dist/gobox_linux_amd64
