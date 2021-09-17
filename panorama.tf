
resource "aws_instance" "panorama" {
  ami                         = var.ami_id
  instance_type               = var.vmSize
  key_name                    = var.aws_ssh_key
  monitoring                  = false
  subnet_id                   = aws_subnet.panorama_subnet.id
  vpc_security_group_ids      = [aws_security_group.panorama.id]
  associate_public_ip_address = true

  tags = {
    Name        = var.vmName
    application = "Panorama"
  }
}
