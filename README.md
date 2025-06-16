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

## Install gcp cli at https://cloud.google.com/sdk/docs/install#deb

gcloud container clusters get-credentials mircoservices-gke-cluster --region us-central1 --project microservices-463006

kubectl apply -f deployment.yaml

# 4. Expose Service to internet with LB

kubectl apply -f service.yaml

# 5. CI/CD [Implement a CI/CD pipeline to automate the build and deployment process].