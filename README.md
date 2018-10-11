# docker-kubernetes-guide
Learn Docker, Travis, Kubernetes and AWS, GCP GKE to Build, test, and deploy applications production-style development workflows
 

Course Resource
* [Docker and Kubernetes: The Complete Guide](https://www.udemy.com/docker-and-kubernetes-the-complete-guide)  

Skills
1. Docker
2. Travis
3. Kubernetes
4. AWS
5. DevOps
6. GCP GKE

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
build dockerfile with -f
```
  > cd frontend
  > docker build -t frontend -f Dockerfile.dev .
```
run docker container with volume mapping
```
  > cd frontend
  > docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app <image_id>
  > docker-compose up
```
run docker container with npm test
```
  > cd frontend
  > docker run -it <image_id> npm run test
  > docker exec -it <container_id> npm run test
```
docker attach container
```
  > docker container ls -a
  > docker attach <container_id>
```
build fib multi-container app image
```
  > cd complex
  > cd client
  > docker build -f Dockerfile.dev -t smalltides/fib-client .
  > docker run smalltides/fib-client
  > cd ..
  > cd server
  > docker build -f Dockerfile.dev -t smalltides/fib-server .
  > docker run smalltides/fib-server
  > cd ..
  > cd worker
  > docker build -f Dockerfile.dev -t smalltides/fib-worker .
  > docker run smalltides/fib-worker
```
run fib multi-container app
```
  > cd complex
  > docker-compose up
```
install minikube
```
  > brew install kubectl
  > brew cask install minikube
  > install VirtualBox
  > minikube delete (if need, if install fail)
  > minikube start
  > kubectl cluster-info
```
apply k8s config
```
  > cd simplek8s
  > kubectl apply -f client-pod.yaml
  > kubectl apply -f client-node-port.yaml
  > kubectl get pods
  > kubectl get services
  > minikube ip
```
k8s pod describe, logs, exec
```
  > kubectl describe pod <pod-name>
  > kubectl logs <pod-name>
  > kubectl exec -it <pod-name> <command>
```
delete k8s object
```
  > cd simplek8s
  > kubectl delete -f client-pod.yaml
```
k8s deployment
```
  > kubectl apply -f client-deployment.yaml
  > kubectl get deployments
  > kubectl get pods -o wide
```
force update k8s container image
```
  > kubectl set image deployment/fib-client-deployment fib-client=smalltides/fib-client
  > kubectl set image <object-type>/<object-name> <container_name>=<new_image_use>
```
get minikube docker env
```
  > minikube docker-env
  > eval $(minikube docker-env)
```

![](https://raw.githubusercontent.com/smalltide/docker-kubernetes-guide/master/img/complex-k8s-infra.png "complex-k8s-infra")

apply k8s config from a folder
```
  > cd complexk8s
  > kubectl apply -f k8s
```
get k8s storage class (PROVISIONER)
```
  > kubectl get storageclass
  > kubectl get persistentVolumes
  > kubectl get pv
  > kubectl get pvc
```
create k8s secret
```
  > kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password
  > kubectl create secret <secret_type> <secret_name> --from-literal key=value
  > kubectl get secrets
```
install ingress-nginx
```
  > kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
  > minikube addons enable ingress
  > kubectl --namespace=ingress-nginx get deployment
  > kubectl --namespace=ingress-nginx get pod
  > kubectl --namespace=ingress-nginx get <resource_type>
  > kubectl apply -f k8s
  > kubectl get ingress
```
open minikube dashboard
```
  > minikube dashboard
```
run travis CLI in docker
```
  > docker run -it -v $(pwd):/app ruby:2.3 sh
  > gem install travis --no-rdoc --no-ri
  > travis login
  > travis encrypt-file service-account.json -r smalltide/docker-kubernetes-guide
```
install Helm (k8s package manager)
```
  > https://docs.helm.sh/using_helm/
  > https://docs.helm.sh/using_helm/#gke
  > curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
  > chmod 700 get_helm.sh
  > ./get_helm.sh
```
GKE service account
```
  > kubectl create serviceaccount --namespace kube-system tiller
  > kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
  > helm init --service-account tiller --upgrade
```
install ingress-nginx using Helm
```
  > helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
```