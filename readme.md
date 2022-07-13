# Doing Data Science using R: A Guide for Social Scientists

# Building

We assume that this will be built from inside an RStudio (server) session running in a docker container.

## Create docker image

The docker image can be created from the accompanying [Dockerfile](Dockerfile).
Run 
```
make docker
``` 
to create this image.
The resulting image will always be called `janacek:latest`.

This image is also available on [DockerHub](https://hub.docker.com) and can be obtained with the `docker pull` command:
```
docker pull xmjandrews/janacek:latest
```

## Run docker container

The shell script [run_docker.sh](run_docker.sh) will run the container and allow the rocker based RStudio server session to accessed through the browser.
Do
```
source docker/run_docker.sh 
```
The open a browser at `http://localhost:8788`. Log in with username "rstudio" and password "foo".


## Make individual chapters

In the RStudio server session, open the Linux terminal (not R console).
Do the following to access the book's home directory.
```
cd book
```

Next, source the [setenv.sh](setenv.sh), which sets up the environment for building the book.
```
source setenv.sh
```

Next, install `sparklyr`. (For some reason, this does not install automatically when making the docker container, despite being in the Dockerfile as a `run` command.)
```
Rscript -e "sparklyr::spark_install()"
```

The following script will make all chapter pdfs and copy them to a directory called `build`:
```
bash build.sh
```

The following script will make all chapter slides and copy them to a directory called `build_slides`:
```
bash build_slides.sh
```



