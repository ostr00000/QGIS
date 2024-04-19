DOCKER=docker compose

docker_rebuild:
	$(DOCKER) build

docker_rebuild_force:
	$(DOCKER) build --no-cache

docker_up:
	$(DOCKER) up --detach

docker_recreate:
	$(DOCKER) up --force-recreate --detach

docker_stop:
	$(DOCKER) stop

docker_bash:
	$(DOCKER) exec -it qgis-build /bin/bash

docker_compile_qgis:
	$(DOCKER) exec qgis-build /QGIS/ms-windows/mingw/build.sh
