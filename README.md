# Irembo
DevOps-Engineer-home-takeaway

# Create a python application
# Create a docker image of the application
`docker build -f Dockerfile -t helloworld:latest .`
Can't take a step further and manage containers with docker compose
Run the docker image with
`docker run -p 5001:5000 helloworld` -- run the application in container and map it to port 5001. Access it on the web with 0.0.0.0:5001

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
4 instances of helloWorld
# I have written about this topic before here
https://medium.com/google-cloud/deploy-python-application-to-google-cloud-with-docker-and-kubernetes-db33ee9fbed3