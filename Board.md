# Board Number - 00007 - ConfigMaps
- A ConfigMap is an API object used to store non-confidential data in key-value pairs.
- A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.
- ConfigMap does not provide secrecy or encryption. If the data you want to store are confidential, use a Secret rather than a ConfigMap
- Pods can consume ConfigMaps as 
    1. Inside a container command and args
    2. Environment variables for a container
    3. Add a file in read-only volume, for the application to read
    4. Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

# Board Number - 00006 - command, args and environment variable for pods
1. **Entrypoint (command)**
**Definition**: Overrides the default entrypoint of the container image.
**Purpose**: Specifies the main executable or script that the container runs when it starts.
**Behavior**: If defined, it completely replaces the default entrypoint specified in the container image.

2. **Args**
**Definition**: Appends or overrides the default arguments passed to the entrypoint.
**Purpose**: Specifies additional arguments for the entrypoint command.
**Behavior**: If command is not defined, args are passed to the default entrypoint of the container image.

# Board Number - 00005 - Services

```plaintext
                              +---------------+
                              |  Client   |
                              +---------------+
                                       |
                                       |  (Access NodePort)
                                       v
                              +---------------+
                              |  Node      |
                              |  (NodePort: 30007) |
                              +---------------+
                                       |
                                       |  (Route to Service)
                                       v
                              +---------------+
                              |  Service   |
                              |  (port: 80)  |
                              +---------------+
                                       |
                                       |  (Route to Pod)
                                       v
                              +---------------+
                              |  Pod       |
                              |  (targetPort: 80) |
                              +---------------+
                                       |
                                       |  (Container listening)
                                       v
                              +---------------+
                              |  Container  |
                              |  (listening on 8080) |
                              +---------------+
```

# Board Number - 00004 - How to install vagrant
1. Install virtual box
```
https://www.virtualbox.org/wiki/Downloads
```

2. Download and install vargrant
```
https://developer.hashicorp.com/vagrant/install
```

3. Open the powershell and run the following commands
```sh
vagrant box add ubuntu/noble64
vagrant init ubuntu/noble64
vagrant plugin install vagrant-vbguest
vagrant up
```  

# Board Number - 00003 - Create Replicaset
A **ReplicaSet** in Kubernetes is a resource that ensures a specified number of pod replicas are running at any given time. It is primarily used to maintain the desired state of pods, ensuring high availability and fault tolerance.

### Key Features of a ReplicaSet:
1. Pod Replication
2. Self-Healing
3. Selector Matching
4. Declarative Management


```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

### Commands to Work with ReplicaSets:
- **Create a ReplicaSet:**
```sh
kubectl apply -f replicaset.yaml
```

- **View ReplicaSets:**
```sh
kubectl get replicaset
```

- **Describe a ReplicaSet:**
```sh
kubectl describe replicaset <replicaset-name>
```

- **Delete a ReplicaSet:**
```sh
kubectl delete replicaset <replicaset-name>
```

- **Change replica on the fly**
```sh
kubectl scale replicaset nginx-replicaset --replicas=5
```

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
