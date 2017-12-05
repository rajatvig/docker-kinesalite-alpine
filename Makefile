OWNER=rajatvig
IMAGE_NAME=kinesalite-alpine
VCS_REF=`git rev-parse --short HEAD`
IMAGE_VERSION=1.$(TRAVIS_BUILD_NUMBER)
QNAME=$(OWNER)/$(IMAGE_NAME)

GIT_TAG=$(QNAME):$(VCS_REF)
BUILD_TAG=$(QNAME):$(IMAGE_VERSION)
LATEST_TAG=$(QNAME):latest

.DEFAULT_GOAL := help

build: ## build the image
	docker build \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg IMAGE_VERSION=$(IMAGE_VERSION) \
		-t $(GIT_TAG) .

lint: ## validate docker lint rules
	docker run -it --rm --privileged -v `pwd`:/root/ \
					 projectatomic/dockerfile-lint \
					 dockerfile_lint

test: lint build ## test the docker image
	dgoss run -p 4567:4567 $(GIT_TAG)

tag: build ## tag the built docker image
	docker tag $(GIT_TAG) $(BUILD_TAG)
	docker tag $(GIT_TAG) $(LATEST_TAG)

run: ## run the image
	docker run -d -t -p 4567:4567 $(GIT_TAG)

login:
	@docker login -u "$(DOCKER_USER)" -p "$(DOCKER_PASS)"

push: login tag ## push to the docker registry
	docker push $(GIT_TAG)
	docker push $(BUILD_TAG)
	docker push $(LATEST_TAG)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
