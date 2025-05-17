kubectl delete all --all
kubectl create -f deployment-nginx-definition.yaml
kubectl create -f deployment-busybox-definition.yaml
kubectl create -f service-nginx-definition.yaml
sleep 3
kubectl get pods