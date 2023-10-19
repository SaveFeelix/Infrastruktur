terraform {
  required_version = ">=1.6.1"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0.2"
    }
  }
}

provider "docker" {}


/* Infrastruktur */
/* Ports starten bei 8001 */
module "Repository" {
  IMAGE_REPOSITORY_VERSION = "3.61.0"
  NETWORK_BRIDGE_ID        = docker_network.BRIDGE.id

  source = "./Repository"
}


/* API's */
/* Ports starten bei 9001 */
module "MC-NamesApi" {
  NETWORK_BRIDGE_ID      = docker_network.BRIDGE.id
  IMAGE_SERVER_VERSION   = "3.0.0"
  IMAGE_DATABASE_VERSION = "11.1.2-jammy"
  ENV_JWT_TOKEN          = var.ENV_JWT_TOKEN_MCNAMESAPI
  source                 = "./MC-NamesApi"
}