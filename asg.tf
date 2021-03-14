resource "aws_launch_template" "mebe" {
  name_prefix   = "mylnch"
  image_id      = "ami-09246ddb00c7c4fef"
  instance_type = "${var.vm_type}"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-2a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.mebe.id}"
    version = "$Latest"
  }
}
