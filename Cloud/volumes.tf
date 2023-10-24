resource "docker_volume" "DATABASE_DATA" {
  name = "Cloud-Database-Data"
}
resource "docker_volume" "CLOUD_DATA" {
  name = "Cloud-Cloud-Data"
}