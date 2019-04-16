############## Allowing Specific Ports to access the webserver ##############

resource "aws_security_group" "web_sg" {
  name = "webserver-sg"

  tags {
    Name        = "web-server-sg"
  }

  vpc_id = "${aws_vpc.xylem_terraform.id}"

  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing ssh access for the webserver"
  }

  ingress {
    from_port       = "80"
    to_port         = "80"
    protocol        = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "Allow the http traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


################## Completing the aws security group ##################






