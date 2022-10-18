provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "intro" {
  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terraform"
  vpc_security_group_ids = ["sg-0601f80ef6eeab6d5"]
  tags = {
    Name = "devops"
  }
}