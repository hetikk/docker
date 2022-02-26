.PHONY: build-service1 build-service2 build-services build-image1 build-image2 build-images build-all start stop restart

SERVICE1_IMAGE = service-1
SERVICE1_CONTAINER = service-1

SERVICE2_IMAGE = service-2
SERVICE2_CONTAINER = service-2

build-service1:
	@ mvn --projects service1 clean package

build-service2:
	@ mvn --projects service2 clean package

build-services: build-service1 build-service2

build-image1:
	@ docker build -t $(SERVICE1_IMAGE) -f ./docker/service1.dockerfile .

build-image2:
	@ docker build --no-cache -t $(SERVICE2_IMAGE) -f docker/service2.dockerfile .

build-images: build-image1 build-image2

build-all: build-services build-images

start:
	@ docker run -d -p 8001:8001 --name $(SERVICE1_CONTAINER) $(SERVICE1_IMAGE)
	@ docker run -d -p 8002:8002 --name $(SERVICE2_CONTAINER) $(SERVICE2_IMAGE)

stop:
	@ docker stop $(SERVICE1_CONTAINER)
	@ docker stop $(SERVICE2_CONTAINER)

restart:
	@ docker stop $(SERVICE1_CONTAINER)
	@ docker stop $(SERVICE2_CONTAINER)
	@ docker restart $(SERVICE1_CONTAINER)
	@ docker restart $(SERVICE2_CONTAINER)
