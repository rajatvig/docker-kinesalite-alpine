IMAGE_NAME=rajatvig/kinesalite-alpine

stop:
	docker stop local-kinesis

clean: stop
	docker rmi $(IMAGE_NAME):local

build: stop
	docker build -t $(IMAGE_NAME):local .

run:
	docker rm local-kinesis
	docker run -d -p 4567:4567 --name=local-kinesis $(IMAGE_NAME):local
