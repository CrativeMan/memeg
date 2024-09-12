GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOMOD=$(GOCMD) mod
BINARY_NAME=main

all: build

build: 
	$(GOBUILD) -o $(BINARY_NAME)

test: 
	$(GOTEST) -v ./...

clean: 
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_UNIX)

run:
	$(GOBUILD) -o $(BINARY_NAME)
	./$(BINARY_NAME)

mod:
	$(GOMOD) tidy

.PHONY: all build test clean run mod
