variable "region" {
 description = "AWS region"
 type = string
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
  default     = "dev"
}


variable "vpc_name" {
 description = "VPC name"
 type = string
}

variable "vpc_cidr" {
 description = "CIDR block for VPC"
 type      = string
}

variable "public_subnet_name" {
 description = "Name for public subnet"
 type = string
}

variable "private_subnet_name" {
   description = "Name for private subnet"
 type = string
}

variable "public_subnet_cidr" {
   description = "CIDR block for public subnet"
 type = string
}

variable "private_subnet_cidr" {
   description = "CIDR block for private subnet"
type = string
}

variable "public_ami_id" {
   description = "AMI ID for public EC2 instance"
 type = string
}

variable "private_ami_id" {
   description = "AMI ID for private EC2 instance"
 type = string
}

variable "public_sg_name" {
   description = "Security Group name for public EC2"
 type = string
}

variable "private_sg_name" {
 description = "Security Group name for private EC2"
 type = string
}

variable "ingress_ports" {
 description = "List of ports to allow inbound on public SG"
 type = list(number)
}

variable "instance_type" {
 description = "EC2 instance type"
 type = string
}

variable "key_name" {
 description = "AWS Key Pair name"
 type = string
}
variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default = {
    Owner   = "Vaibhav"
    Project = "Terraform-VPC"
  }
}