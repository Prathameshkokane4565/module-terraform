output "vpc_cidr_block" {
  value = aws_vpc.private-network.id
}

output "sub_cidr_block" {
  value = aws_subnet.pub-subnet.id
}

output "public_ip" {
  value = aws_subnet.pub-subnet.map_public_ip_on_launch
}

output "az" {
  value = aws_subnet.pub-subnet.availability_zone
}

output "aws_security_group_id" {
  value = aws_security_group.network-sg.id
}

output "subnet_id" {
  value = aws_subnet.pub-subnet.id
}