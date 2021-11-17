

/*
provider "kubectl" {
  host = aws_eks_cluster.cluster_obligatorio.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.cluster_obligatorio.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.main.token
  load_config_file = false
}*/