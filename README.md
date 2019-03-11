# docker-alpine-llvm-7.0

This project generates a Docker image based on the latest Alpine version with LLVM in 
version 7.0. That image can for instance be used for Python-project that uses numba >= 0.42.0.

# Docker image
The latest version of the image is hosted on [Dockerhub](https://hub.docker.com/r/larsklitzke/alpine-llvm7.0). 

You can use the image in your project by pulling it from Dockerhub with

```bash

  docker pull larsklitzke/alpine-llvm7.0
  
```