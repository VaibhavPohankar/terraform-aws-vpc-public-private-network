# Public EC2 instance public IP
output "public_instance_public_ip" {
  description = "Public IP address of the public EC2 instance"
  value       = aws_instance.public_instance.public_ip
}

# Public EC2 instance private IP
output "public_instance_private_ip" {
  description = "Private IP of the public EC2 instance"
  value       = aws_instance.public_instance.private_ip
}

# Private EC2 instance private IP
output "private_instance_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private_instance.private_ip
}

# VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc_terraform.id
}

# Subnet IDs
output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private_subnet.id
}

# NAT Gateway info
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.nat_for_private.id
}

output "nat_gateway_public_ip" {
  description = "Elastic IP of NAT Gateway"
  value       = aws_eip.for_nat.public_ip
}

# Route table IDs
output "public_route_table_id" {
  description = "Public route table ID"
  value       = aws_route_table.public_rt_vpc_terraform.id
}

output "private_route_table_id" {
  description = "Private route table ID"
  value       = aws_route_table.private_rt_vpc_terraform.id
}
