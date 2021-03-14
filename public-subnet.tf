locals{
  azs_names = "${data.aws_availability_zones.azs.names}"
}

resource "aws_subnet" "pubsub" {
  count = "${length(local.azs_names)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index)}"
  availability_zone = "${local.azs_names[count.index]}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pubsub-${count.index}"
  }
}
