run: build up composer-install seed

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

bash:
	docker exec -it app-rmc /bin/bash

nginx:
	docker exec -it app-nginx /bin/bash

composer-install:
	docker exec -it app-rmc composer install

sleep:
	sleep 5

seed:
	docker exec -it app-rmc bin/console doctrine:database:create
	docker exec -it app-rmc bin/console doctrine:migrations:migrate --no-interaction

cache-clear:
	docker exec -it app-rmc bin/console cache:clear