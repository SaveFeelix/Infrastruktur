resource "docker_network" "INTERNAL" {
  name = "Cloud-Internal"
  internal = true
  attachable = true
}