terraform {
  required_version = "1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  backend "s3" {
    bucket = "aashi-test-bucket"
    key    = "terraform/misba"
    region = "us-east-1"
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"

}

resource "aws_instance" "aj_instance" {
  ami           = var.prj_ami_id
  instance_type = var.prj_instance_type
  key_name      = var.prj_key_name
  tags = {
    Name = var.prj_instance_name
  }
}

