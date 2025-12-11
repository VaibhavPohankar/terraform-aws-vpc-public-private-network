\"\"\"Terraform AWS VPC: Public & Private Network

This project builds an AWS VPC using Terraform with a public subnet,
private subnet, NAT Gateway, Internet Gateway, route tables, and EC2
instances. It demonstrates a production-style network architecture using
Infrastructure-as-Code.

Architecture - VPC: 10.0.0.0/16 - Public Subnet with Internet Gateway -
Private Subnet with NAT Gateway (outbound only) - Public EC2 (SSH
allowed) - Private EC2 (no public IP) - Route tables and security groups

Diagram VPC (10.0.0.0/16) │ ├── Public Subnet (10.0.1.0/24) │ ├── IGW │
└── Public EC2 │ ├── Private Subnet (10.0.2.0/24) ├── NAT Gateway
(Elastic IP) └── Private EC2

Files - main.tf -- VPC, Subnets, NAT, EC2 - provider.tf -- AWS provider
config - variables.tf -- Input variables - terraform.tfvars --
Deployment values - outputs.tf -- Output values - README.md - Diagram

Deploy terraform init terraform plan terraform apply

Highlights - AWS VPC networking - Public and private subnet design - NAT
Gateway outbound internet - Terraform variables + tagging - Real DevOps
portfolio project \"\"\"
