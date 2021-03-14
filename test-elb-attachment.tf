resource "aws_elb_attachment" "classice2" {
  count = 1
  elb      = "${aws_elb.classic-elb2.id}"
  instance = "${aws_instance.web1.*.id[count.index]}"
}
