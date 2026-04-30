TARGET=evilginx
PACKAGES=core database log parser

.PHONY: all build clean install
all: build

build:
	@go build -o ./build/$(TARGET) -mod=vendor main.go

# install target: build and copy binary to ~/bin for personal use
install: build
	@mkdir -p ~/bin
	@cp ./build/$(TARGET) ~/bin/$(TARGET)
	@echo "Installed $(TARGET) to ~/bin/$(TARGET)"

clean:
	@go clean
	@rm -f ./build/$(TARGET)

# run target: convenience shortcut to launch after building
run: build
	@./build/$(TARGET)
