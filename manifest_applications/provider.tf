provider "aws" {
  region = "us-east-1"
}
data "terraform_remote_state" "eks_state" {
  backend = "s3"
  config = {
    bucket = "${var.ENV}-states"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "kubernetes" {
  //cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_state.outputs.kubeconfig-certificate-authority-data_out)
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}