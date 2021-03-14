resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow  inbound traffic"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg"
  }
}
