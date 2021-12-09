provider "kubernetes" {
  //cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_state.outputs.kubeconfig-certificate-authority-data_out)
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}