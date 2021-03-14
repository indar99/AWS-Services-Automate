resource "aws_instance" "web" {
  count = "${var.vm_cnt}"
  ami           = "${var.amis[data.aws_availability_zones.azs.names[0]]}"
  instance_type = "${var.vm_type}"
  security_groups = ["${aws_security_group.mysg.id}"]
  subnet_id = "${aws_subnet.pubsub.*.id[count.index]}" 
  key_name = "private"
  user_data = "${file("apache.sh")}"

  tags = {
    Name = "webser-${count.index}"
  }
}
