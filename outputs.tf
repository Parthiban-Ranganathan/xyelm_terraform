
output "vpc_id" {
  value = "${aws_vpc.xylem_terraform.id}"
}

#output "alb_dns_name" {
# value= "${aws_lb.terraform_external.dns_name}"
#}


output "web_server_id" {
  value = "${aws_instance.terraform_server.id}"
}


output "web_server_public_ip" {
  value = "${aws_instance.terraform_server.public_ip}"
}


output "public_subnet_a" {
  value = "${aws_subnet.terraform_demo_public_subnet_a.id}"
}

output "public_subnet_b" {
  value = "${aws_subnet.terraform_demo_public_subnet_b.id}"
}
