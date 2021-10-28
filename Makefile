build: clean
	docker-compose -f docker-compose.yml up

clean:
	docker container stop $(shell docker ps -a -q --filter ancestor=docker-nodejs-postgres-test_app) || exit 0
	docker container stop $(shell docker ps -a -q --filter name=docker-nodejs-postgres-test_postgres) || exit 0
	docker container rm $(shell docker ps -a -q --filter ancestor=docker-nodejs-postgres-test_app) || exit 0
	docker container rm $(shell docker ps -a -q --filter name=docker-nodejs-postgres-test_postgres) || exit 0
	docker rmi $(shell docker images -q docker-nodejs-postgres-test_app) || exit 0
