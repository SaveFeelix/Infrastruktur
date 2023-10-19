resource "docker_image" "REPOSITORY_IMAGE" {
  name         = "sonatype/nexus3:${var.IMAGE_REPOSITORY_VERSION}"
  keep_locally = true
}