terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.39.0"
    }
  }
}

provider "google" {
  project = "microservices-463006"
  credentials = "microservices-463006-621b97fb5092.json"
}
resource "google_container_cluster" "gke_cluster" {
  name     = "mircoservices-gke-cluster"
  location = "us-central1"
  initial_node_count = 1
}
