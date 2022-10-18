variable REGION {
  default = "us-east-1"
}

variable ZONE1 {
  default = "us-east-1a"
}

variable AMIS {
  type = map
  default = {
    us-east-1 = "ami-08c40ec9ead489470"
  }
}