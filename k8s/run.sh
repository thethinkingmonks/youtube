kubectl delete deployment.apps/mydeployment-busybox
kubectl delete deployment.apps/mydeployment-nginx
kubectl delete service/myservice-nginx
kubectl create -f deployment-nginx-definition.yaml
kubectl create -f deployment-busybox-definition.yaml
kubectl create -f service-nginx-definition.yaml
sleep 3
kubectl get pods