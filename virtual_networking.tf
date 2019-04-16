data "aws_availability_zones" "available" {}

####### Creating the Virtual Private Cloud Network ######################

resource "aws_vpc" "xylem_terraform" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "xylem_terraform_vpc"
  }
}

####### Completing Virtual Private Cloud Network Part ####################


######  Creating the Internet Gateway to Virtual Private Cloud to communicate Outside the World ##########


resource "aws_internet_gateway" "xylem_igw" {
  vpc_id = "${aws_vpc.xylem_terraform.id}"

  tags {
    Name        = "xylem-terraform-igw"
  }
}

resource "aws_route" "routing_traffic_outeside" {
  route_table_id         = "${aws_vpc.xylem_terraform.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.xylem_igw.id}"
}

#####  Internet Gateway Completion ################

#### START - Public subnets

resource "aws_subnet" "terraform_demo_public_subnet_a" {
  vpc_id            = "${aws_vpc.xylem_terraform.id}"
  cidr_block        = "${var.terraform_demo_public_subnet_a}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name        = "terraform_demo_public_subneta"
  }
}


resource "aws_subnet" "terraform_demo_public_subnet_b" {
  vpc_id            = "${aws_vpc.xylem_terraform.id}"
  cidr_block        = "${var.terraform_demo_public_subnet_b}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name        = "terraform_demo_public_subnet-b"
  }
}





