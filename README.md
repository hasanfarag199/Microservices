<!-- [![Build and Deploy to GKE](https://github.com/hasanfarag199/Microservices/actions/workflows/gke_cd.yml/badge.svg)](https://github.com/hasanfarag199/Microservices/actions/workflows/gke_cd.yml)
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
check github actions workflow as ci_cd.yml -->

[![Build and Deploy to GKE](https://github.com/hasanfarag199/Microservices/actions/workflows/gke_cd.yml/badge.svg)](https://github.com/hasanfarag199/Microservices/actions/workflows/gke_cd.yml)

# Microservices Deployment on GKE

This guide walks you through building a Docker image, provisioning infrastructure with Terraform, deploying to Google Kubernetes Engine (GKE), and automating with GitHub Actions CI/CD.

---

## 1. Docker

**Build the Docker image:**
```bash
docker build -t microservice-app .
```

**Run locally:**
```bash
docker run -it -p 5000:5000 microservice-app
```

---

## 2. Google Cloud Platform (GCP) Setup

- **Create a Service Account**  
  - Assign the role: `Kubernetes Engine Cluster Admin` or `Editor`.
  - Generate a `key.json` for authentication.

- **Enable APIs:**  
  - Enable the **Kubernetes Engine API** for your project.

---

## 3. Infrastructure Provisioning with Terraform

**Initialize Terraform:**
```bash
terraform init
```

**Review the plan:**
```bash
terraform plan
```

**Apply the configuration:**
```bash
terraform apply
```

---

## 4. Build & Push Docker Image to GitHub Container Registry

**Tag the image:**
```bash
docker tag microservice-app:latest ghcr.io/hasanfarag199/microservice-app:latest
```

**Authenticate to GitHub Container Registry:**
```bash
export CR_PAT=<your-token>
echo $CR_PAT | docker login ghcr.io -u <USERNAME> --password-stdin
```

**Push the image:**
```bash
docker push ghcr.io/hasanfarag199/microservice-app:latest
```

---

## 5. Install Google Cloud CLI & Authenticate

**Install Google Cloud CLI and GKE Auth Plugin:**
```bash
sudo apt-get update
sudo apt-get install google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin
```
- [Install instructions](https://cloud.google.com/sdk/docs/install#deb)
- [GKE Auth Plugin](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#install_plugin)

**Authenticate with Google Cloud:**
```bash
gcloud auth login --no-launch-browser
# Enter the verification code in the CLI
gcloud config set project microservices-463006
gcloud components install gke-gcloud-auth-plugin
```

**Get GKE Cluster Credentials:**
```bash
gcloud container clusters get-credentials mircoservices-gke-cluster --region us-central1 --project microservices-463006
```

---

## 6. Deploy to GKE with Kubernetes YAML

**Set the image variable and deploy:**
```bash
export DEPLOY_IMG="ghcr.io/hasanfarag199/microservice-app:latest"
envsubst < deployment.yml | kubectl apply -f -
kubectl apply -f service.yml
```

---

## 7. Expose Service to the Internet

**Test the service:**
```bash
curl http://<EXTERNAL_IP>/products
# Example response:
# [{"id":1,"name":"Laptop"},{"id":2,"name":"Smartphone"}]
```

---

## 8. CI/CD Pipeline

A GitHub Actions workflow automates build and deployment.  
See: [`.github/workflows/gke_cd.yml`](https://github.com/hasanfarag199/Microservices/actions/workflows/gke_cd.yml)

---

## 9. Troubleshooting

- **Image not found:** Ensure the image is pushed and the correct image path is used in `deployment.yml`.
- **Kubernetes errors:** Check `kubectl get pods` and `kubectl describe pod <pod-name>` for logs.
- **Permissions:** Ensure your service account has the necessary roles.

---

## 10. References

- [Google Cloud SDK Install](https://cloud.google.com/sdk/docs/install)
- [GKE Auth Plugin](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#install_plugin)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

---

**For interview submission:**  
This README covers all steps for provisioning, deployment, and exposing the service, including all commands and