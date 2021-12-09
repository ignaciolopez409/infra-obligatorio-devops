terraform {
  backend "s3" {
    bucket = "develop-states-obligatorio-2021"
    key = "terraform-app.tfstate"
    region = "us-east-1"
    //dynamodb_table = "develop-lock"
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