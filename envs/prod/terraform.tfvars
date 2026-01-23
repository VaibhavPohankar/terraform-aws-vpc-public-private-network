region      = "ap-south-1"
name_prefix = "prod"

vpc_cidr = "10.0.0.0/16"

azs = ["ap-south-1a", "ap-south-1b"]

public_subnets = {
  "0" = "10.0.1.0/24"
  "1" = "10.0.2.0/24"
}

private_subnets = {
  "0" = "10.0.11.0/24"
  "1" = "10.0.12.0/24"
}

create_nat = true

tags = {
  Environment = "production"
  Project     = "network"
}
