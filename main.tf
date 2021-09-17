terraform {
  required_version = "~> 1.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.55"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.region
}
