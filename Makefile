GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOMOD=$(GOCMD) mod
GOVET=$(GOCMD) vet
GOFMT=$(GOCMD) fmt
GOLINT=golint
BINARY_NAME=memeg
SRC_DIR=./src
OUT_DIR=./bin

all: build

build: 
	$(GOBUILD) -o $(OUT_DIR)/$(BINARY_NAME) $(SRC_DIR)

test: 
	$(GOTEST) -v ./...

clean: 
	$(GOCLEAN)
	rm -f $(OUT_DIR)/$(BINARY_NAME)

run:
	$(GOBUILD) -o $(OUT_DIR)/$(BINARY_NAME) $(SRC_DIR)
	./$(OUT_DIR)/$(BINARY_NAME)

mod:
	$(GOMOD) tidy

vet:
	$(GOVET) ./...

fmt:
	$(GOFMT) ./...

lint:
	$(GOLINT) ./...

help:
	@echo "Makefile commands:"
	@echo "  all    - Build the project"
	@echo "  build  - Build the binary"
	@echo "  test   - Run tests"
	@echo "  clean  - Clean the build"
	@echo "  run    - Build and run the binary"
	@echo "  mod    - Tidy up the modules"
	@echo "  vet    - Run go vet"
	@echo "  fmt    - Format the code"
	@echo "  lint   - Run golint"
	@echo "  help   - Display this help message"

.PHONY: all build test clean run mod vet fmt lint help