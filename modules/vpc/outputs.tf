output "vpc_id" {
  value = aws_vpc.this.id
}
output "public_subnets" {
  value = [for s in aws_subnet.public : s.id]
}
output "private_subnets" {
  value = [for s in aws_subnet.private : s.id]
}
output "nat_gateway_id" {
  value = length(aws_nat_gateway.nat) > 0 ? aws_nat_gateway.nat[0].id : null
}
output "nat_public_ip" {
  value = length(aws_eip.nat) > 0 ? aws_eip.nat[0].public_ip : null
}
