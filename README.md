# 1 .Docker
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
# 4. Expose Service to internet with LB
# 5. CI/CD [Implement a CI/CD pipeline to automate the build and deployment process].