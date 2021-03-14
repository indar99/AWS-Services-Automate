resource "aws_internet_gateway" "pub-igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "pub-igw"
  }
}
