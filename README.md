# Docker
docker build -t microservice-app .
docker run -it -p 5000:5000 microservice-app
# GCP
Create a service account with Role "Kubernetes Engine Cluster Admin" and Generate a key.json to authenticate terraform to gcp api
Enable "Kubernetes Engine API" for the associated project
# Terraform
terraform init
terraform plan 
terraform apply