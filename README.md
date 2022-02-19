# Guide for Terraform:

- Learning 1 : If .tfvars file is available in another directory
then you will have to use --var-file option during terraform validate
, terraform plan and terraform apply. Please refer below for an example.
>> _terraform plan --var-file ./env_configuration/terraform.tfvars_

