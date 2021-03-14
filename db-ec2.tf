resource "aws_instance" "db" {
  count = "${var.vm_cnt}"
  ami           = "${var.amis[data.aws_availability_zones.azs.names[2]]}"
  instance_type = "${var.vm_type}"
  security_groups = ["${aws_security_group.privsg.id}"]
  subnet_id = "${aws_subnet.privsub.*.id[count.index]}" 
  key_name = "private"
  tags = {
    Name = "dbserver"
  }
}
