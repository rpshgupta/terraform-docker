# Guide for Terraform:

---
_Description :_

We are going to create containers & images using terraform. 

https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

----

_Pre-requisities :_
- Docker should be Installed. 
- Terraform .exe file path is present in system env variables.
- IDE(IntellJ Community Version) with Terrform plugin.

---

_Learnings :_
1) You need to specify a provider either in main.tf OR _provider.tf so that tf can download the neccessary binaries in the root folder(present directory).
   You can refer to this [link](https://registry.terraform.io/browse/providers) for other providers.
   _provider.tf will look like below:

```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }

```
2) After creating _provider.tf, we need to initialize terraform in so that it can download the required binaries using :
```
terraform init
```
3) For creating resources, you have to use a .tf file with resource specific name.Here we will use general name like main.tf for pulling an image.
```
resource "docker_image" "ubuntu" {
  name = var.ImageName
}
```
4) Use variable.tf (declaring variables) & output.tf (use a created resource somewhere else)
* **_variable.tf :_**
```
variable "ImageName" {}
```

* **_output.tf :_**
```
output "Ubuntu_Image_Id" {
  value = docker_image.ubuntu.id
}
```

5) Use ``` terraform fmt``` to format your .tf files.
6) Use ``` terraform validate  ``` to check the configuration is syntactically valid and internally consistent.
7) We can use ``` terraform.tfvars ``` to automatically load the variables at runtime.
``` 
ImageName = "ubuntu:latest" 
env = "dev"
```
8) If .tfvars file is available in another directory
then you will have to use --var-file option during terraform validate
, terraform plan and terraform apply. Please refer below for an example.
```
terraform plan --var-file ./env_configuration/terraform.tfvars
```
9) Modules:

