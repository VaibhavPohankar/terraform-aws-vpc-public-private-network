variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
}
variable "name_prefix" {
  type        = string
  description = "Prefix used for naming all resources"
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC e.g. 10.0.0.0/16"
}
variable "azs" {
  type        = list(string)
  description = "List of availability zones to deploy subnets in"
}
variable "public_subnets" {
  type        = map(string)
  description = "Map of public subnet CIDRs keyed by index"
}
variable "private_subnets" {
  type        = map(string)
  description = "Map of private subnet CIDRs keyed by index"
}
variable "create_nat" {
  type        = bool
  default     = true
  description = "Whether to create a NAT gateway for private subnets"
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags applied to all resources"
}
