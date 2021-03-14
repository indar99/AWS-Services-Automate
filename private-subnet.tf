
resource "aws_subnet" "privsub" {
  count = "${length(slice(local.azs_names,0,2))}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index + length(local.azs_names[count.index]))}"
  availability_zone = "${local.azs_names[count.index]}"

  tags = {
    Name = "privsub-${count.index}"
  }
}
