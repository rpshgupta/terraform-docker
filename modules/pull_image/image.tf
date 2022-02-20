resource "docker_image" "postgres" {
  name = format("${var.ImageName}:${var.tag}")
}
