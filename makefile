run: build up cache-clear composer-install seed

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

bash:
	docker exec -it rmc /bin/bash

nginx:
	docker exec -it nginx /bin/bash

composer-install:
	docker exec -it rmc composer install

sleep:
	sleep 5

seed:
	docker exec -it rmc bin/console doctrine:database:create
	docker exec -it rmc bin/console doctrine:migrations:migrate --no-interaction

cache-clear:
	docker exec -it rmc bin/console cache:clear

consume-async:
	docker exec -it rmc bin/console messenger:consume async -vv

unit-tests:
	docker exec -it rmc ./bin/phpunit -c phpunit.xml --testdox --testsuite unit

integration-tests:
	docker exec -it rmc ./bin/phpunit -c phpunit.xml --testdox --testsuite integration

test: unit-tests integration-tests