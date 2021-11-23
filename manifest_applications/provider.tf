provider "aws" {}
data "terraform_remote_state" "eks_state" {
  backend = "s3"
  config = {
    bucket = "obligatorio"
    key = "${var.ENV}/terraform.tfstate"
    region = var.region
  }
  provider = aws
}

provider "kubernetes" {
  host = data.terraform_remote_state.eks_state.outputs.endpoint_out
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_state.outputs.kubeconfig-certificate-authority-data_out)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.terraform_remote_state.eks_state.outputs.eks_cluster_name]
    command = "aws"
  }
  insecure = true
}

provider "helm" {
  kubernetes {
    host = data.terraform_remote_state.eks_state.outputs.endpoint_out
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_state.outputs.kubeconfig-certificate-authority-data_out)
  }
}