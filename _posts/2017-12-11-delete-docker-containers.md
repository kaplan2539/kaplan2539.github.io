---
title: Delete unused Docker containers & images
tags: docker
---

Out of disk space again? Get rid of some left overs from past Docker experiments!

Delete all exited Docker containers:
```
docker ps -aq --no-trunc | xargs docker rm
```

Delete all `dangling` Docker images:
```
docker images -qf dangling=true | xargs docker rmi
```
