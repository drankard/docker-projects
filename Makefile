env: 
	eval $(docker-machine env)
init:
	ln -s ~/.ssh ssh_keys
	git clone git@github.com:skm-ice/configuration.git

up:
	docker-compose up -d
down:
	docker-compose down

build:
	docker-compose build

rebuild: down build

connect_ansible_host:
	docker exec -u ansible_user -it ansible_host bash
ps:
	docker-compose ps

reset: down build up
