resource "aws_instance" "intro" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terraform"
  vpc_security_group_ids = ["sg-0601f80ef6eeab6d5"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}