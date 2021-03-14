resource "aws_route_table" "pub-rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pub-igw.id}"
  }


  tags = {
    Name = "pub-rt"
  }
}
