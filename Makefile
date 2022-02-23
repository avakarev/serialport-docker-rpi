_run:
	cd ./v$(VERSION) && npm ci && DEBUG=serialport* node ./index.js

_docker-build:
	docker build --file Dockerfile -t serialport:v$(VERSION) ./v$(VERSION)

_docker_run:
	docker run --rm --device /dev/ttyUSB0 -v /run/udev:/run/udev:ro -e DEBUG=serialport* serialport:v$(VERSION)

docker-run-v9:
	$(MAKE) _docker-build VERSION=9
	$(MAKE) _docker_run VERSION=9

run-v9:
	$(MAKE) _run VERSION=9

docker-run-v10:
	$(MAKE) _docker-build VERSION=10
	$(MAKE) _docker_run VERSION=10

run-v10:
	$(MAKE) _run VERSION=10
