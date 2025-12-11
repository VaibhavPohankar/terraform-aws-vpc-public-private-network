resource "aws_vpc" "vpc_terraform" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(
    var.common_tags,
    { Name = var.vpc_name }
  )
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_terraform.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    { Name = var.public_subnet_name }
  )
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = var.private_subnet_cidr

  tags = merge(
    var.common_tags,
    { Name = var.private_subnet_name }
  )
}

resource "aws_security_group" "sg_public" {
  name        = var.public_sg_name
  description = "Public security group"
  vpc_id      = aws_vpc.vpc_terraform.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    { Name = var.public_sg_name }
  )
}

resource "aws_security_group" "private_sg_vpc_terraform" {
  name        = var.private_sg_name
  description = "Private security group"
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   #change it according to you cidr
   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    { Name = var.private_sg_name }
  )
}

resource "aws_internet_gateway" "igw_vpc_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = merge(
    var.common_tags,
    { Name = "igw_vpc_terraform" }
  )
}

resource "aws_route_table" "public_rt_vpc_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = merge(
    var.common_tags,
    { Name = "public_rt_vpc_terraform" }
  )
}

resource "aws_route_table" "private_rt_vpc_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = merge(
    var.common_tags,
    { Name = "private_rt_vpc_terraform" }
  )
}

resource "aws_route_table_association" "public_rt_vpc_terraform" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt_vpc_terraform.id
}

resource "aws_route_table_association" "private_rt_vpc_terraform" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt_vpc_terraform.id
}

resource "aws_route" "public_rt_to_igw" {
  route_table_id         = aws_route_table.public_rt_vpc_terraform.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_vpc_terraform.id
}

resource "aws_eip" "for_nat" {
  tags = merge(
    var.common_tags,
    { Name = "nat_eip" }
  )
}

resource "aws_nat_gateway" "nat_for_private" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.for_nat.id

  tags = merge(
    var.common_tags,
    { Name = "nat_for_private" }
  )
}

resource "aws_route" "private_to_nat" {
  route_table_id         = aws_route_table.private_rt_vpc_terraform.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_for_private.id
}

resource "aws_instance" "public_instance" {
  ami                    = var.public_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  key_name               = var.key_name

  tags = merge(
    var.common_tags,
    { Name = "public_ec2" }
  )
}

resource "aws_instance" "private_instance" {
  ami                         = var.private_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [aws_security_group.private_sg_vpc_terraform.id]
  associate_public_ip_address = false
  key_name                    = var.key_name

  tags = merge(
    var.common_tags,
    { Name = "private_ec2" }
  )
}
