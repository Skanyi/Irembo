# Irembo
DevOps-Engineer-home-takeaway

# Create a python application
# Create a docker image of the application
`docker build -f Dockerfile -t kanyi/helloworld:latest .`
Can't take a step further and manage containers with docker compose
Run the docker image with
`docker run -p 5001:5000 helloworld` -- run the application in container and map it to port 5001. Access it on the web with 0.0.0.0:5001

Can push the image to dockerhub.
 `docker push kanyi/helloworld`

# Create deployment and run the app in kubernetes
WE going to use minikube to run the app in kubernetes
Create a deployment file.
`kubectl apply -f deployment.yaml`

Expose the app by creating a service file  you can run this on terminal without creating service file. 
`kubectl expose deployment helloworld --type="LoadBalancer"`
Using files make it easy to manage. 
`kubectl create -f service.yml`

Apply autoscaling on resources
`kubectl autoscale deployment helloworld --cpu-percent=50 --min=1 --max=10`

NB: might want to run `eval $(minikube docker-env)` so that minikube can see the local images. Or you can push to dockerhub. 

Finally to access the service deployed with minikube,
Run the follwing command and use the url generated. 
`minikube service helloworld-service --url`

Notes:
Creating a loadbalanced service exposing port 5000
1 instance of helloWorld
Scale to max 10 instances each handling 50% or workload

### Manage Kubernetes Cluster with HELM 
Create the app chart
`helm create app`

Edit the output to have the only files we need for this project. 

After you done, create the release of the app
`helm install -f helloworld.yaml helloworld ./app`

# Create a namespace
`kubectl create -f hello-namespace.json`

# Install the app in that namespace
`helm install --namespace helloworld -f helloworld.yaml helloworld ./app`

# can update the context and change the namespace
`kubectl config set-context minikube --namespace=helloworld`


### Deploy default redis chart to helloworld namespace
Install redis chart(bitnami)
`helm repo add bitnami https://charts.bitnami.com/bitnami`
`helm install helloworld-redis bitnami/redis`

### Connect helloworld app to redis
Using the port and and password given, you can connect via tcp. Need to create a redis config file that sets the value neede. 
It has a clien-server connection architecture.  

`kubectl port-forward --namespace helloworld helloworld-redis-master 6379:6379 & redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD`

### Technology Used
Docker
Local Kubernetes cluster -- minikube
Kubernetes command line - kubectl
Helm

# I have written about this topic before here
https://medium.com/google-cloud/deploy-python-application-to-google-cloud-with-docker-and-kubernetes-db33ee9fbed3