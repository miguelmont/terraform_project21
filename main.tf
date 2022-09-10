provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "default" {}

resource "aws_instance" "server1" {
  ami = "ami-0c7c4e3c6b4941f0f"
  instance_type = var.server_size
  vpc_security_group_ids = [aws_security_group.sg1.id]
  tags = {
    Name = "${var.server_name}"
  }
}

resource "aws_eip" "eip-server1" {
  instance = aws_instance.server1.id
  tags ={
    Name = "eip-${var.server_name}"
  }
}
resource "aws_security_group" "sg1" {
  name = "general security group"
  vpc_id = data.aws_vpc.default.id
  dynamic "ingress" {
    for_each = var.sg_ports
    content{
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-${var.server_name}"
  }
}