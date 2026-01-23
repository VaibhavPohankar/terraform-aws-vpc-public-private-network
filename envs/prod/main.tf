provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "../../modules/vpc"
  name_prefix     = var.name_prefix
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  create_nat      = var.create_nat
  tags            = var.tags
}
