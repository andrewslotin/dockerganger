container:
	docker build --no-cache -t andrewslotin/doppelganger:devel .

push: container
	docker push andrewslotin/doppelganger:devel

.PHONY: container push
