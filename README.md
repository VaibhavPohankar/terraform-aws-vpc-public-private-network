# Terraform AWS VPC (Public + Private)  
Production-ready, reusable VPC module with public/private subnets, single-NAT design, AZ-based layout, environment separation, and CI workflow.

## Features
- Public & private subnets across AZs 
- Single-NAT strategy (cost optimized) 
- IGW + RTs + associations 
- Environment isolation (production, staging) 
- S3 backend ready
- CI validation

## Usage (quick)
```
module "vpc" {
source = "modules/vpc"
name_prefix = "demo"
vpc_cidr = "10.0.0.0/16"
azs = ["ap-south-1a", "ap-south-1b"]
public_subnets = { "0" = "10.0.1.0/24" }
private_subnets = { "0" = "10.0.11.0/24" }
```
## Environments
cd envs/production
terraform init
terraform apply
