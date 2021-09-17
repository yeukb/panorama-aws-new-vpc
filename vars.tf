variable "aws_access_key" { }

variable "aws_secret_key" { }

variable "vpc_name" { }

variable "region" { }

variable "aws_ssh_key" { }

variable "AllowedSourceIPRange" { }

variable "vmName" { }

variable "vmSize" { }

variable "vpc_cidr" {
    default = "172.31.0.0/20"
}

variable "panorama_subnet" {
    default = "172.31.0.0/24"
}

variable "ami_id" {}

variable "add_data_disk" {}
