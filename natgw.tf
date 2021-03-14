resource "aws_nat_gateway" "natgw" {
  count = "${length(local.azs_names)-2}"
  allocation_id = "${aws_eip.myeip.id}"
  subnet_id     = "${aws_subnet.pubsub.*.id[count.index]}"

  tags = {
    Name = "MyNAT"
  }
}

