terraform {
  backend "s3" {
    bucket = "infra-obligatorio-states"
    key    = "${var.ENV}/terraform.tfstate"
    region = "${var.region}"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}