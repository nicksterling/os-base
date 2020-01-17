build: | check pull build-docker

pull:
	docker pull archlinux:latest
	docker pull ubuntu:18.04

build-docker: | build-archlinux-base build-ubuntu-base

build-archlinux-base:
	docker build -t nicksterling/archlinux-base ./archlinux-base

build-ubuntu-base:
	docker build -t nicksterling/ubuntu-base ./ubuntu-base

build-alpine-base:
	docker build -t nicksterling/alpine-base ./alpine-base

clean:
	echo 'y' | docker system prune -a

# Check if dependencies are installed
check: | DOCKER-exists
DOCKER-exists: ; @which docker > /dev/null

