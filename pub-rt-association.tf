resource "aws_route_table_association" "pub-rt-ass" {
  count = "${length(local.azs_names)}" 
  subnet_id      = "${aws_subnet.pubsub.*.id[count.index]}"
  route_table_id = "${aws_route_table.pub-rt.id}"
}
