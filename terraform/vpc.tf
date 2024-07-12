resource "aws_vpc" "kokishin_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform_kokishin_vpc"
  }
}

resource "aws_subnet" "kokishin_public_1a_sn" {
  vpc_id = aws_vpc.kokishin_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.az_a}"
}

resource "aws_internet_gateway" "kokishin_igw" {
  vpc_id = aws_vpc.kokishin_vpc.id
}

resource "aws_route_table" "kokishin_public_rt" {
  vpc_id = aws_vpc.kokishin_vpc.id
}

resource "aws_route_table_association" "kokishin_public_rt_association" {
  route_table_id = aws_route_table.kokishin_public_rt.id
  subnet_id = aws_subnet.kokishin_public_1a_sn.id
}

data "http" "ifconfig" {
  url = "http://ipv4.icanhazip.com/"
}

variable "allowed_cidr" {
  default = null
}

locals {
  myip = chomp(data.http.ifconfig.response_body)
  allowed_cidr = (var.allowed_cidr == null) ? "${local.myip}/32" : var.allowed_cidr
}

resource "aws_security_group" "kokishin_ec2_sg" {
  name = "kokishin_ec2_sg"
  description = "for ec2 linux"
  vpc_id = aws_vpc.kokishin_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [local.allowed_cidr]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

