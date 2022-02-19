# Guide for Terraform:

---
_Description :_

We are going to create containers & images using terraform. 

https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

----

_Pre-requisites :_
- Docker should be Installed. 
- Terraform .exe file path is present in system env variables.
- IDE(IntellJ Community Version) with Terrform plugin.

---

_Learnings :_
1) You need to specify a provider either in main.tf OR _provider.tf so that tf can download the necessary binaries in the root folder(present directory).
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


---

_Faced Error:_

* 'Permission Denied (publickey)' error when I push!
  * [Solution:](https://gist.github.com/adamjohnson/5682757) 
    * > This means, on your local machine, you haven't made any SSH keys. Not to worry. Here's how to fix: 
      > Open git bash (Use the Windows search. To find it, type "git bash") or the Mac Terminal. Pro Tip: You can use any *nix based command prompt (but not the default Windows Command Prompt!)
      > Type cd ~/.ssh. This will take you to the root directory for Git (Likely C:\Users\[YOUR-USER-NAME]\.ssh\ on Windows)
      > Within the .ssh folder, there should be these two files: id_rsa and id_rsa.pub. These are the files that tell your computer how to communicate with GitHub, BitBucket, or any other Git based service. Type ls to see a directory listing. If those two files don't show up, proceed to the next step. NOTE: Your SSH keys must be named id_rsa and id_rsa.pub in order for Git, GitHub, and BitBucket to recognize them by default. 
      > To create the SSH keys, type ssh-keygen -t rsa -C "your_email@example.com". This will create both id_rsa and id_rsa.pub files. 
      > Now, go and open id_rsa.pub in your favorite text editor (you can do this via Windows Explorer or the OSX Finder if you like, typing open . will open the folder). 
      > Copy the contents--exactly as it appears, with no extra spaces or lines--of id_rsa.pub and paste it into GitHub and/or BitBucket under the Account Settings > SSH Keys. NOTE: I like to give the SSH key a descriptive name, usually with the name of the workstation I'm on along with the date. 
      > Now that you've added your public key to Github and/or BitBucket, try to git push again and see if it works. It should!
* 