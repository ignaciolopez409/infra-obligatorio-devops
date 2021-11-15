terraform {
  backend "s3" {
    bucket = "infra-obligatorio-states"
    key    = "develop/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}