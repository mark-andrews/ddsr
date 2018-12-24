# Doing Data Science using R: A Guide for Social Scientists

# Building

We assume that this will be built from inside an RStudio (server) session running in a docker container.

## Create docker image

The docker image can be created from the accompanying [Dockerfile](Dockerfile).
Run `Make docker` to create this image.
The resulting image will always be called `jancek:latest`.

## Run docker container

The shell script [run_docker.sh](run_docker.sh) will run the container and allow the rocker based RStudio server session to accessed through port 8788.

## Make individual chapters

First, source the [setenv.sh](setenv.sh).
```
source setenv.sh
```

To build the individual chapters, `cd` into them, and run `make`, and then `make clean`. 
The primary output document type is `pdf_document` but Markdown, html, and docx documents are also created.
None except `pdf_document` will be rendered exactly as intended.