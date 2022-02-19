#provider "docker" {
#  host = "tcp://localhost:2375"
#}

resource "docker_image" "ubuntu" {
  name = var.ImageName
  #  name = "ubuntu:latest"
}

#resource "docker_container" "createdUsingTFUbuntu" {
#  image = docker_image.ubuntu.latest
#  name  = "createdUsingTFUbuntu"
#}