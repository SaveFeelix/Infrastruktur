resource "docker_image" "CLOUD" {
  name = "nextcloud:${var.IMAGE_CLOUD_VERSION}"
  keep_locally = true
}
resource "docker_image" "DATABASE" {
  name = "mariadb:${var.IMAGE_DATABASE_VERSION}"
  keep_locally = true
}
resource "docker_image" "REDIS" {
  name = "redis:${var.IMAGE_REDIS_VERSION}"
    keep_locally = true
}