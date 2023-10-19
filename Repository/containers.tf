resource "docker_container" "REPOSITORY" {
  depends_on = [docker_image.REPOSITORY_IMAGE, docker_volume.DATA]
  image      = docker_image.REPOSITORY_IMAGE.image_id
  name       = "Repository"
  restart    = "always"

  ports {
    internal = 8081
    external = 8001
  }
  networks_advanced {
    name = var.NETWORK_BRIDGE_ID
  }
  volumes {
    volume_name    = docker_volume.DATA.id
    container_path = "/nexus-data"
  }
}