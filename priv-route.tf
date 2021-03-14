resource "aws_route_table" "priv-rt" {
  count = "${length(local.azs_names)-2}"
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.natgw.*.id[count.index]}"
  }


  tags = {
    Name = "priv-rt"
  }
}
