#variable "aws_access_key" {}
#variable "aws_secret_key" {}
#variable "region" {}



variable "terraform_key" {
 default="xylem_terraform"
 description="aws ssh key to communicate the EC2 instance"
}

variable "vpc_cidr" {
 default="10.0.0.0/16"
 description="VPC CIDR Xyelm_Terraform"
}


variable "terraform_demo_public_subnet_a" {
 default="10.0.1.0/24"
 description="terraform_demo_public_subnet id"
}

variable "terraform_demo_public_subnet_b" {
 default="10.0.2.0/24"
 description="terraform_demo_public_subnet id"
}

variable "instance_ami" {
 default="ami-0889b8a448de4fc44"
 description="terraform webserver ami"
}


variable "instance_type" {
 default="t2.micro"
 description= "webserver instance type"
}




