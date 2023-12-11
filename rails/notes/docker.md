```markdown
# Dockerized Basics

## Table of Contents
- [What is Docker?](#what-is-docker)
- [Key Concepts](#key-concepts)
- [Installation](#installation)
- [Docker Images](#docker-images)
- [Docker Containers](#docker-containers)
- [Dockerfile](#dockerfile)
- [Docker Compose](#docker-compose)
- [Docker Commands](#docker-commands)
- [Tips and Best Practices](#tips-and-best-practices)
- [Resources](#resources)

## What is Docker?

[Docker](https://www.docker.com/) is a platform for developing, shipping, and running applications in containers. Containers allow developers to package an application with all parts it needs, such as libraries and dependencies, and ship it all out as one package.

## Key Concepts

- **Image:** A lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools.

- **Container:** A runtime instance of a Docker image. Containers run applications in isolated environments on a host machine.

- **Dockerfile:** A script that contains instructions for building a Docker image.

- **Docker Compose:** A tool for defining and running multi-container Docker applications.

## Installation

To get started with Docker, you need to [install Docker](https://docs.docker.com/get-docker/) on your machine. Follow the installation instructions for your operating system.

## Docker Images

A Docker image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools.

- Pulling an image from Docker Hub:
  ```bash
  docker pull image_name:tag
  ```

- Listing local images:
  ```bash
  docker images
  ```

## Docker Containers

A Docker container is a runnable instance of a Docker image.

- Running a container:
  ```bash
  docker run image_name:tag
  ```

- Listing running containers:
  ```bash
  docker ps
  ```

- Stopping a container:
  ```bash
  docker stop container_id
  ```

## Dockerfile

A Dockerfile is a script that contains instructions for building a Docker image.

Example Dockerfile:
```Dockerfile
# Use an official base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy application files into the container
COPY . .

# Install dependencies
RUN apt-get update && \
    apt-get install -y python3

# Define the command to run the application
CMD ["python3", "app.py"]
```

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications.

Example `docker-compose.yml`:
```yaml
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
```

- Running a Docker Compose application:
  ```bash
  docker-compose up
  ```

## Docker Commands

- **docker ps:** List running containers.
- **docker exec -it container_id /bin/bash:** Access a container's shell.
- **docker logs container_id:** View container logs.
- **docker rm container_id:** Remove a stopped container.
- **docker rmi image_id:** Remove an image.
- **docker cp /path/to/local/file.txt my_container:/app/file.txt


## Tips and Best Practices

- Keep images small by minimizing layers.
- Use `.dockerignore` to exclude unnecessary files from the build context.
- Tag your images for versioning and clarity.
- Use Docker Compose for multi-container applications.

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

```
