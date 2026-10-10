.PHONY: update lint test

update:
	go get -u ./...
	go mod tidy

lint:
	golangci-lint run ./...

test:
	go test -race -count=1 ./...
