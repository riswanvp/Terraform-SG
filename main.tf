terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>2.70"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_security_group" "web" {
    name = "${"var.project_name"}-web-access-SG"
    description = "${"var.project_name"} - ${"var.env"}-webaccess"
    vpc_id = "var.vpc_id"
    tags = {
        name = "${"var.project_name"}-${"var.env"}-webaccess"
    }
  
}

resource "aws_security_group_rule" "inbound" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.web.id
}
resource "aws_security_group_rule" "inbound2" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id =  aws_security_group.web.id
}
resource "aws_security_group_rule" "outbound" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"                 // All protcol
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.web.id
}