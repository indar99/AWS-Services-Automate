# Create a new load balancer
resource "aws_elb" "classic-elb2" {
  name               = "classic-elb2"
  subnets      = "${aws_subnet.pubsub.*.id}"
  security_groups = ["${aws_security_group.mysg.id}"]

  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 100



  tags = {
    Name = "Classic-elb2"
   }

}



