terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  region = "us-south"
}


resource "ibm_container_cluster" "k8s" {
  name            =  "k8s-cluster"
  datacenter      = "dal10"
  machine_type    = "u2c.2x4"
  hardware        = "shared"
  public_vlan_id  = "vlan"
  private_vlan_id = "vlan"
  default_pool_size = 2

  labels = {
    "cluster-pool" = "microservice-pool"
  }

}