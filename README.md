snap remove kubectl
snap install kubectl --classic
kubectl version --client
kubectl cluster-info
sudo kubectl version --client
snap install minikube
snap install VirtualBox-6.1
/usr/bin/minikube start --driver=virtualbox

minikube status
minikube start
minikube dashboard

kubectl get deployment

kubectl delete deployment first-app

minikube stop

kubectl get pods
kubectl delete pod first-app-565965d99f-7cfgv

-----------------------------------
eval $(minikube docker-env)
docker build -t kubernetes-first-app:<version> . 
docker tag kubernetes-first-app 12482/kubernetes-first-app:<version>
docker push 12482/kubernetes-first-app:<version>
kubectl create deployment first-app --image=12482/kubernetes-first-app:<version>
kubectl get deployment first-app
kubectl expose deployment first-app --type=LoadBalancer --port=8080
kubectl get services
minikube service first-app
kubectl scale deployment/first-app --replicas=3
------------------------Update new image
before this you should push your new image into docker hub
kubectl set image deployment/<name of our deployment>  <Container name from browser pod list>=<image name>:<version>
-----------------------------------
-this command will be show the status of new update if it was correct or not
kubectl rollout status deployment/first-app

-whith this command new invalid deployment would be rollback automaticaly.
kubectc rollout undo deployment/first-app
kubectc rollout undo deployment/first-app -to--revision=2

-this command shows history of rollout
kubectl rollout history deployment/first-app

-Is same as befor command but shows third revision
kubectl rollout history deployment/first-app --revision=3

----------------------------------

kubectl create deployment first-app --image=12482/kubernetes-first-app --dry-run=client -o=yaml > deployment.yaml
kubectl apply -f=deployment.yaml,service.yaml
kubectl delete -f=deployment.yaml,service.yaml
#delete with label
kubectl delete deployment,services -l group=example



docker tag kubernetes-first-app 12482/kubernetes-first-app
--------------------------------------------Start
kubectl expose deployment first-app --type=ClusterIP --port=8080
ClusterIP -> shows that it will only be reachable inside the cluster
kubectl expose deployment first-app --type=NodePort --port=8080
NodePort -> ip of worker node

kubectl expose deployment first-app --type=LoadBalancer --port=8080
LoadBalancer -> Will add a unique address for the service and destibute incomming trafic accross all pods

kubectl get services
minikube service first-app

--------------------------------------------End

kubectl config view

kubectl logs -l app=first-app
kubectl logs --tail=200 -l app=first-app

kubectl explain deployment

kubectl describe deployments first-app



------------------------------------------
kubectl scale deployment/first-app --replicas=3



------------------------Resource Defenition File






