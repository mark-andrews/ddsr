SOURCES := $(shell find ./ -type d -name "chapter_[0-9]*")

.PHONY: $(SOURCES) all docker

all: $(SOURCES)

$(SOURCES):
	$(MAKE) --directory=$@

docker:
	docker build -t janacek .

