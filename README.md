# docker-kubernetes-guide
Learn Docker, Travis, Kubernetes and AWS to Build, test, and deploy applications production-style development workflows
 

Course Resource
* [Docker and Kubernetes: The Complete Guide](https://www.udemy.com/docker-and-kubernetes-the-complete-guide)  

Skills
1. Docker
2. Travis
3. Kubernetes
4. AWS
5. DevOps

chech docker version and run first docker container
```
  > docker version
  > docker run hello-world
```
docker run and command
```
  > docker run busybox echo hi there
  > docker run busybox ls
  > docker run hello-world ls
```
docker ps find containers
```
  > docker ps -a
  > docker run busybox ping google.com
  > docker container ls -a
```
docker create and docker start
```
  > docker create hello-world
  > docker container ls -a
  > docker start -a <container_id>
```
![](https://raw.githubusercontent.com/smalltide/docker-kubernetes-guide/master/img/container1.png "container1")
![](https://raw.githubusercontent.com/smalltide/docker-kubernetes-guide/master/img/container2.png "container2")

remove unuse docker resource
```
  > docker system prune
```
watch log in docker container
```
  > docker logs <container_id>
```
stop docker container
```
  > docker stop <container_id>
  > docker kill <container_id>
```
docker run a redis server
```
  > docker run redis
  > docker exec -it <container_id>
```
build a docker image from Dockerfile
```
  > docker build -t ice-redis-server .
```
build docker image from a container
```
  > docker commit -c '<CMD>' <container_id>
```
docker run and port mapping
```
  > docker run -p 8080:8080 <docker_image>
```
docker run container in background
```
  > docker run -d redis
```
use docker-compose to run multi-containers
```
  > cd redisvisits
  > docker-compose up
  > docker-compose up -d
  > docker-compose up --build
  > docker-compose down
  > docker-compose ps
```