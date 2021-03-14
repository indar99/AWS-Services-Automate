variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "amis" {
  default = {
    "us-east-2a" = "ami-09246ddb00c7c4fef"
    "us-east-2b" = "ami-08962a4068733a2b6"
    "us-east-2c" = "ami-0f052119b3c7e61d1"
  }
}

variable "vm_type" {
  default = "t2.micro"
}

variable "vm_cnt" {
  default = "2"
}

variable "amis-region" {
  default = "us-east-2"
}
