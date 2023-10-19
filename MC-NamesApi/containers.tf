resource "docker_container" "DATABASE" {
  image    = docker_image.DATABASE.image_id
  name     = "MC-NamesApi-Database"
  hostname = "mcnamesapi-database"
  restart  = "always"

  env = [
    "MARIADB_ROOT_PASSWORD=mcnamesapi"
  ]
  networks_advanced {
    name = docker_network.INTERNAL.name
  }
  volumes {
    container_path = "/var/lib/mysql"
    volume_name    = docker_volume.DATABASE_DATA.id
  }
}
resource "docker_container" "SERVER" {
  depends_on = [docker_container.DATABASE]
  image      = docker_image.SERVER.image_id
  name       = "MC-NamesApi-Server"
  restart    = "always"

  env = [
    "DB_HOST=mcnamesapi-database",
    "DB_PASSWORD=mcnamesapi",
    "JWT_TOKEN=${var.ENV_JWT_TOKEN}",
    "JWT_DURATION=24"
  ]

  networks_advanced {
    name = docker_network.INTERNAL.name
  }
  networks_advanced {
    name = var.NETWORK_BRIDGE_ID
  }
  ports {
    internal = 80
    external = 9001
  }
  volumes {
    container_path = "/app/Logs"
    volume_name    = docker_volume.SERVER_LOGS.id
  }
  // TODO Add Logs-Volume
}