run: build up composer-install

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

bash:
	docker exec -it app-rmc /bin/bash

composer-install:
	docker-compose exec -T app-rmc composer install

cache-clear:
	docker-compose exec -T app-rmc bin/console cache:clear