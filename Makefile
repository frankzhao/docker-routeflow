ROOT		:= $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
NAME		:= docker-routeflow
REPOSITORY	:= frankzhao/docker-routeflow
VERSION		:= 1.0

.PHONY: all build clean

all: build

build:
	@docker build -t $(REPOSITORY) $(ROOT)

run:
	@docker run \
		--privileged --name $(NAME) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(shell which docker):$(shell which docker) \
		-it $(REPOSITORY)

clean:
	@docker rmi -f $(BUILDER)
