output "ami_id" {
  value = aws_instance.pub-server.ami
}
output "instance_type" {
  value = aws_instance.pub-server.instance_type
}

output "key_name" {
  value = aws_instance.pub-server.key_name
}