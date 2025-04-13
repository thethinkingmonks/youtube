# Board Number - 00002 - Creation of Pods
1. Start cluster
2. Check status of cluster
3. Stop cluster
4. Delete cluster
5. Pod manifest file
6. Run pod
7. Check status of pods
8. Debugging image download error
9. Add a worker node

### 1. Start cluster
```sh
minikube start
```

### 2. Check status of cluster
```sh
minikube status
```

### 3. Stop cluster
```sh
minikube stop
```

### 4. Delete cluster
```sh
minikube delete
```

### 5. Pod manifest file
```yaml
apiVersion:
kind: 
metadata:
spec:
```
### 6. Run the pod
```sh
kubectl run nginx --image=nginx --dry-run=client -o yaml > 0001-pods.yaml
kubectl apply -f 0001-pods.yaml
kubectl get pods
kubectl describe pods 
```
### 7. Check the status
```sh
kubectl get pods
```

### 8. Debugging image download error
```sh
 curl -I https://registry-1.docker.io/v2/
 docker login
 docker login -u thinkingmonks
 ```

### 9. Add worker node
```sh
minikube node add
```

# Board Number - 00001 - Installation of Minikube
1. Install docker
2. Install kubectl
3. Install minikube
4. Create cluster
5. Kubernetes commands
   
### 1. Install docker
```sh
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo systemctl enable docker
docker --version
```

### 2. Install kubectl
```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin
```

### 3. Install Minikube
```sh
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl
sudo apt install apt-transport-https
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod 755 /usr/local/bin/minikube
minikube version
```

### 4. create cluster using minikube
```sh
minikube start
```

### 5. Kubernetes commands
```sh
# view kubectl config
kubectl config view

# view cluster info
kubectl cluster-info

# get node info
kubectl get nodes

# get pod info
kubectl get pod

# minikube status
minikube status

# minikube add-ons
minikube addons list

# minikube dashboard
minikube dashboard
```
