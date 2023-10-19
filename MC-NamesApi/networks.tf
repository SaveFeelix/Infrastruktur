resource "docker_network" "INTERNAL" {
  name = "MC-NamesApi-Internal"
  internal = true
  attachable = true
}