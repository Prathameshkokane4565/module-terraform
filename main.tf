module "vpc" {
  source = "./vpc"
  vpc_cidr_block = "192.168.0.0/16"
  sub_cidr_block = "192.168.0.0/26"
  public_ip = true
  az = "ap-south-1a"
}

module "ec2" {
  source = "./ec2"
  ami_id = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  key_name = "mumbaikeypair"
  subnet_id = module.vpc.subnet_id
  vpc_security_group_ids = module.vpc.aws_security_group_id
}