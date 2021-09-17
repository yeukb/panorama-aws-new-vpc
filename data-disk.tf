resource "aws_ebs_volume" "panorama_data_disk" {
  count = var.add_data_disk ? 1 : 0

  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 2048

  tags = {
    Name = "Panorama_Data_Disk"
  }
}

resource "aws_volume_attachment" "panorama_attachment" {
  count = var.add_data_disk ? 1 : 0

  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.panorama_data_disk[0].id
  instance_id = aws_instance.panorama.id
}
