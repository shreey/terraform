resource "aws_key_pair" "dove-key" {
  key_name   = "devops"
  public_key = file("devops.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-0601f80ef6eeab6d5"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    type        = "ssh"
    #user        = "ubuntu"
    private_key = file("devops")
    host = self.public_ip
    agent = "true"
  }
}