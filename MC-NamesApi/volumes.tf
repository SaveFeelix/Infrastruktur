resource "docker_volume" "DATABASE_DATA" {
  name = "MC-NamesAPI-Database-Data"
}
resource "docker_volume" "SERVER_LOGS" {
  name = "MC-NamesAPI-Server-Logs"
}