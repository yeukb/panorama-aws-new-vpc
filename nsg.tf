resource "aws_security_group" "panorama" {
  name        = "panorama_SG"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "panorama_SG"
  }
}

resource "aws_security_group_rule" "allow_ssh_ingress" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.AllowedSourceIPRange]

  security_group_id = aws_security_group.panorama.id
}

resource "aws_security_group_rule" "allow_https_ingress" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [var.AllowedSourceIPRange]

  security_group_id = aws_security_group.panorama.id
}


resource "aws_security_group_rule" "allow_cortex" {
  type        = "ingress"
  from_port   = 444
  to_port     = 444
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.panorama.id
}

resource "aws_security_group_rule" "allow_fw" {
  type        = "ingress"
  from_port   = 3978
  to_port     = 3978
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.panorama.id
}

resource "aws_security_group_rule" "allow_fw_updates" {
  type        = "ingress"
  from_port   = 28443
  to_port     = 28443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.panorama.id
}

resource "aws_security_group_rule" "allow_all_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.panorama.id
}
