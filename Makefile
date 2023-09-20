DB_VOLUME=~/data/wp_data
WP_VOLUME=~/data/wp_files

all: $(DB_VOLUME) $(WP_VOLUME)
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

$(DB_VOLUME):
	@mkdir -p ~/data/wp_data

$(WP_VOLUME):
	@mkdir -p ~/data/wp_files

clean:
	@docker-compose -f ./srcs/docker-compose.yml down

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker system prune -a -f --volumes

killv: fclean
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@sudo rm -rf ~/data/

re: clean all

hre: fclean killv all

.PHONY: all clean fclean killv re hre
