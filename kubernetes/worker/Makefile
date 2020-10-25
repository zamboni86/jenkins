name = jenkins-worker

build:
	docker build -t $(name) .

restart:
	$(MAKE) clean
	$(MAKE) build
	$(MAKE) run
	$(MAKE) start

run:
	docker run --detach --name $(name) --init jenkins/inbound-agent -url http://localhost:8080 $(name)

start:
	docker start $(name)

stop:
	docker stop $(name) || echo '$(name) container is not running...'

clean:
	$(MAKE) stop
	docker container rm $(name) || echo '$(name) not found'

ssh:
	docker exec -it $(name) bash