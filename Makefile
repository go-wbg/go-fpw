VERSION=0.0.9

fmt:
	find . -name '*.go' -exec gofumpt -w -s -extra {} \;

release: fmt
	github-release release -p -u go-wbg -r "go-fpw" -t v$(VERSION) -n "lib" -d "tag for release"

build: fmt
	go build -o ssbapp/ssbapp ./ssbapp

run: build
	./ssbapp/ssbapp -url http://localhost:7657