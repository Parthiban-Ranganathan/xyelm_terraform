

resource "aws_lb" "terraform_external" {
  load_balancer_type = "application"
  name               = "terraform-alb-web"
  subnets            = ["${aws_subnet.terraform_demo_public_subnet_a.id}", "${aws_subnet.terraform_demo_public_subnet_b.id}"]
  security_groups    = ["${aws_security_group.web_sg.id}"]
}


resource "aws_alb_target_group" "terraform_alb_target_group" {
  name     = "terraform-alb-tg"
  vpc_id   = "${aws_vpc.xylem_terraform.id}"
  port     = "8080"
  protocol = "HTTP"

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
    matcher             = "200"
  }
}


###########################################################
#
# Application Load balancer Listener configuration
#
##########################################################i

resource "aws_alb_listener" "terraform_alb_listener" {
  load_balancer_arn = "${aws_lb.terraform_external.id}"
  port                                            = "80"
  protocol                                = "HTTP"
  default_action {
  target_group_arn  = "${aws_alb_target_group.terraform_alb_target_group.id}"
  type = "forward"
  }
}

resource "aws_alb_target_group_attachment" "terraform_alb_target_group_attachment" {
  target_group_arn = "${aws_alb_target_group.terraform_alb_target_group.arn}"
  target_id        = "${aws_instance.terraform_server.id}"
  port             = "80"
}





