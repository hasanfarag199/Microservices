# 1. Docker
docker build -t microservice-app .

docker run -it -p 5000:5000 microservice-app

# GCP

Create a service account with Role "Kubernetes Engine Cluster Admin" or Editor and Generate a key.json to authenticate terraform to gcp api

Enable "Kubernetes Engine API" for the associated project

# 2. Terraform
terraform init

terraform plan 

terraform apply

# 3. Deploy with k8s yaml as service
docker tag microservice-app:latest ghcr.io/hasanfarag199/microservice-app:latest

export CR_PAT=<your-token>

echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

docker push ghcr.io/hasanfarag199/microservice-app:latest


sudo apt-get install google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin 
## https://cloud.google.com/sdk/docs/install#deb
## https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#install_plugin

gcloud auth login --no-launch-browser

## Enter the verification code in gcloud CLI on the machine you want to log into

gcloud config set project microservices-463006

gcloud components install gke-gcloud-auth-plugin

gcloud container clusters get-credentials mircoservices-gke-cluster --region us-central1 --project microservices-463006

# kubectl apply -f deployment.yml
export DEPLOY_IMG="ghcr.io/hasanfarag199/microservice-app:latest"
envsubst < deployment.yml | kubectl apply -f -
kubectl apply -f service.yml
# 4. Expose Service to internet with LB

curl http://34.72.136.181/products
[{"id":1,"name":"Laptop"},{"id":2,"name":"Smartphone"}]

# 5. CI/CD [Implement a CI/CD pipeline to automate the build and deployment process].
check github actions workflow as ci_cd.yml