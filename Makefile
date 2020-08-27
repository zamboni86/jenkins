name = jenkins

build:
	docker build -t $(name) .

restart:
	$(MAKE) clean
	$(MAKE) build
	$(MAKE) init

init:
	docker run --detach --name $(name) --publish 8080:8080 $(name)

run:
	docker start $(name)

stop:
	docker stop $(name) || echo '$(name) container is not running...'

clean:
	$(MAKE) stop
	docker container rm $(name) || echo '$(name) not found'

ssh:
	docker exec -it $(name) bash