terraform {
  backend "s3" {
    bucket = "infra-obligatorio-states"
    key = "develop/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      profile = "default"
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