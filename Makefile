all:
	docker compose -f ./srcs/docker-compose.yml up -d --build

bonus:
	docker compose -f ./srcs/requirements/bonus/docker-compose.yml up -d --build

fclean:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi $$(docker images -a -q)