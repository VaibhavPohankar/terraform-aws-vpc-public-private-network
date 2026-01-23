variable "region" {}
variable "name_prefix" {}
variable "vpc_cidr" {}
variable "azs" {
  type = list(string)
}
variable "public_subnets" {
  type = map(string)
}
variable "private_subnets" {
  type = map(string)
}
variable "create_nat" {
  default = true
}
variable "tags" {
  type    = map(string)
  default = {}
}

