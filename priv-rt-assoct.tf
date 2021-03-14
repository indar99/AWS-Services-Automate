resource "aws_route_table_association" "prt-asst" {
  count = "${length(local.azs_names)-2}"
  subnet_id      = "${aws_subnet.privsub.*.id[count.index]}"
  route_table_id = "${aws_route_table.priv-rt.*.id[count.index]}"
}

resource "aws_route_table_association" "prt-asst1" {
  count = "${length(local.azs_names)-2}"
  subnet_id      = "${aws_subnet.privsub.*.id[count.index + 1]}"
  route_table_id = "${aws_route_table.priv-rt.*.id[count.index]}"
}

