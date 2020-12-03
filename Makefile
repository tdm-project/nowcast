

all: image

image: Dockerfile nowcast
	docker build . -t tdmproject/nowcast


.PHONY: all image
