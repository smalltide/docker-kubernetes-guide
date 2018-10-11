docker build -t smalltides/fib-client:latest -t smalltides/fib-client:$SHA -f ./client/Dockerfile ./client
docker build -t smalltides/fib-server:latest -t smalltides/fib-server:$SHA -f ./server/Dockerfile ./server
docker build -t smalltides/fib-worker:latest -t smalltides/fib-worker:$SHA -f ./worker/Dockerfile ./worker

docker push smalltides/fib-client:latest
docker push smalltides/fib-server:latest
docker push smalltides/fib-worker:latest

docker push smalltides/fib-client:$SHA
docker push smalltides/fib-server:$SHA
docker push smalltides/fib-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/fib-server-deployment server=smalltides/fib-server:$SHA
kubectl set image deployments/fib-client-deployment client=smalltides/fib-client:$SHA
kubectl set image deployments/fib-worker-deployment worker=smalltides/fib-worker:$SHA
