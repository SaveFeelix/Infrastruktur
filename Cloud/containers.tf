resource "docker_container" "REDIS" {
  image    = docker_image.REDIS.image_id
  name     = "Cloud-Redis"
  hostname = "cloud-redis"
  restart  = "always"

  networks_advanced {
    name = docker_network.INTERNAL.name
  }
}
resource "docker_container" "DATABASE" {
  image    = docker_image.DATABASE.image_id
  name     = "Cloud-Database"
  hostname = "cloud-database"
  restart  = "always"

  env = [
    "MARIADB_ROOT_PASSWORD=cloud",
    "MARIADB_DATABASE=cloud"
  ]
  networks_advanced {
    name = docker_network.INTERNAL.name
  }
  volumes {
    container_path = "/var/lib/mysql"
    volume_name    = docker_volume.DATABASE_DATA.id
  }
}
resource "docker_container" "CLOUD" {
  depends_on = [
    docker_container.DATABASE,
    docker_container.REDIS
  ]
  image   = docker_image.CLOUD.image_id
  name    = "Cloud-Cloud"
  restart = "always"

  env = [
    "MYSQL_HOST=cloud-database",
    "MYSQL_DATABASE=cloud",
    "MYSQL_USER=root",
    "MYSQL_PASSWORD=cloud",
    "REDIS_HOST=cloud-redis",
    "OVERWRITEHOST=cloud.saveapis.com",
    "OVERWRITEPROTOCOL=https",
    "OVERWRITECLIURL=https://cloud.saveapis.com/",
  ]
  networks_advanced {
    name = docker_network.INTERNAL.name
  }
  networks_advanced {
    name = var.NETWORK_BRIDGE_ID
  }
  ports {
    internal = 80
    external = 8002
  }
  volumes {
    container_path = "/var/www/html"
    volume_name    = docker_volume.CLOUD_DATA.id
  }
}