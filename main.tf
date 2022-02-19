resource "docker_image" "ubuntu" {
#  name = format("%s:%s", var.ImageName, var.tag) #correct
  name = format("${var.ImageName}:${var.tag}")
  #  name = "ubuntu:latest"
  #  tags = {
  #    env = var.env
  #    name = format("%s-%s", var.ImageName ,var.env)
  #  } this will not work.
}