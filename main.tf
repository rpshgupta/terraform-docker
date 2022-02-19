#resource "docker_image" "ubuntu" {
##  name = format("%s:%s", var.ImageName, var.tag) #correct
#  name = format("${var.ImageName}:${var.tag}")
#  #  name = "ubuntu:latest"
#  #  tags = {
#  #    env = var.env
#  #    name = format("%s-%s", var.ImageName ,var.env)
#  #  } this will not work.
#}

locals {
  env = "dev"
}

module "image" {
  source = "./modules/pull_image"
}

resource "docker_container" "postgres_container" {
  image = module.image.image_id
#  image = "postgres"
  name  = "${var.env}-container-${var.ImageName}-${var.tag}"
}