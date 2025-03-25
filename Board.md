# Board Number - 00001 - Installation of Minikube
1. Install docker
2. Install kubectl
3. Install minikube
4. Create cluster
   
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
