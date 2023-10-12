terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

module "Repository" {
  IMAGE_REPOSITORY_VERSION = "3.61.0"
  NETWORK_BRIDGE_ID        = docker_network.BRIDGE.id

  source = "./Repository"
}