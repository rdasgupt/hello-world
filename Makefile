#
#*******************************************************************************
#  Contributors:
#     Ranjan Dasgupta - initial drop
#
#*******************************************************************************/
#

export DOCKER_IMAGE_NAME ?= test-http-server
export DOCKER_IMAGE_VERSION ?= 1.0
export DOCKER_IMAGE_PATH ?= $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)


default: all

all: build run check

build:
	@echo $$DOCKER_IMAGE_NAME
	docker build -t $(DOCKER_IMAGE_PATH) -f ./Dockerfile .

run:
	-docker rm -f $(DOCKER_IMAGE_NAME) 2> /dev/null
	docker run -d --name $(DOCKER_IMAGE_NAME) -p 8080:8080 $(DOCKER_IMAGE_PATH)

check:
	docker logs -f $(DOCKER_IMAGE_NAME)

stop:
	-docker stop $(DOCKER_IMAGE_NAME) 2> /dev/null

clean:
	-docker rm -f -v $(DOCKER_IMAGE_NAME) 2> /dev/null
	-docker rmi -f $(DOCKER_IMAGE_PATH) 2> /dev/null


