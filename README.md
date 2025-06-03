# build the docker image
docker build -t microservice-app .
# test the docker container
docker run -it -p 5000:5000 microservice-app

# infra
terraform init
export IC_API_KEY="h-jvm1Q4hZbs1xt-9Zfrs0g2W-2exPR2i3q_864O3jD9"
terraform plan
terraform apply