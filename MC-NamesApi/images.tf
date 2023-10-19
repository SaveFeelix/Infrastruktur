resource "docker_image" "SERVER" {
  name         = "savefeelix/mc-namesapi:${var.IMAGE_SERVER_VERSION}"
  keep_locally = true
}
resource "docker_image" "DATABASE" {
  name = "mariadb:${var.IMAGE_DATABASE_VERSION}"
  keep_locally = true
}