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
![alt text](https://github.com/smalltide/docker-kubernetes-guide/blob/master/img/container1.png "container1")
![alt text](https://github.com/smalltide/docker-kubernetes-guide/blob/master/img/container2.png "container2")

