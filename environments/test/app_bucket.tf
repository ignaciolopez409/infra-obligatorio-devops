terraform {
  backend "s3" {
    bucket = "test-states"
    key = "terraform-app.tfstate"
    region = "us-east-1"
    dynamodb_table = "test-lock"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}