data "aws_vpc" "xylem_terraform" {
 default=true

}

data "aws_subnet_ids" "all" {
 vpc_id="${data.aws_vpc.xylem_terraform.id}"
}

data "template_file" "web_template" {
  template = "${file("user_data.sh")}"
}


resource "aws_instance" "terraform_server" {
  count         = "1"
  instance_type = "${var.instance_type}"
  ami           = "${var.instance_ami}"
  associate_public_ip_address="true"
  tags {
    Name = "terraform_server-${count.index +1}"
  }

  key_name               = "${var.terraform_key}"
  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
  subnet_id              = "${aws_subnet.terraform_demo_public_subnet_a.id}"
  user_data              = "${data.template_file.web_template.rendered}"

}


