terraform {
  backend "s3" {
    bucket = "test-states-obligatorio-2021"
    key = "terraform.tfstate"
    region = "us-east-1"
    //dynamodb_table = "develop-lock"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    kubectl = {
      source = "alon-dotan-starkware/kubectl"
      version = "1.11.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}