build: | check pull build-docker

pull:
	docker pull archlinux:latest
	docker pull nicksterling/archlinux-base-builder || true
	docker pull nicksterling/archlinux-base || true
	docker pull nicksterling/archlinux-devel-builder || true
	docker pull nicksterling/archlinux-devel || true

build-docker: | check build-archlinux 

build-archlinux: | check build-archlinux-base build-archlinux-devel

build-archlinux-base:
	docker build --target base-build -t nicksterling/archlinux-base-builder ./archlinux
	docker build --target base -t nicksterling/archlinux-base ./archlinux

build-archlinux-devel:
	docker build --target devel-build -t nicksterling/archlinux-devel-builder ./archlinux
	docker build --target devel -t nicksterling/archlinux-devel ./archlinux

# build-ubuntu-base:
# 	docker build -t nicksterling/ubuntu-base ./ubuntu-base

# build-alpine-base:
# 	docker build -t nicksterling/alpine-base ./alpine-base

clean:
	echo 'y' | docker system prune 
scrub: 
	echo 'y' | docker system prune -a

# Check if dependencies are installed
check: | DOCKER-exists
DOCKER-exists: ; @which docker > /dev/null

