resource "aws_vpc" "private-network" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "my-private-network"
  }
}

resource "aws_subnet" "pub-subnet" {
  vpc_id = aws_vpc.private-network.id
  cidr_block = var.sub_cidr_block
  map_public_ip_on_launch = var.public_ip
  availability_zone = var.az

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.private-network.id
  tags = {
    Name = "my-internet-gateway"
  }
}

resource "aws_route_table" "rt-for-pub" {
  vpc_id = aws_vpc.private-network.id
  tags = {
    Name = "my-public-route-table"
  }
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "rta" {
  route_table_id = aws_route_table.rt-for-pub.id
  subnet_id = aws_subnet.pub-subnet.id

}

resource "aws_security_group" "network-sg" {
  vpc_id = aws_vpc.private-network.id
  name = "my-network-sg"
  description = "allow all inbound and outbound traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}