resource "aws_eks_cluster" "cluster_obligatorio" {
  name = "cluster-${var.ENV}"
  role_arn = aws_iam_role.eksClusterRole.arn
  version = "1.21"
  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_a_obligatorio.id,
      aws_subnet.subnet_b_obligatorio.id]
  }
  tags = {
    Name = "${var.ENV} EKS Cluster"
  }
}

resource "aws_eks_node_group" "node_group_obligatorio" {
  cluster_name = aws_eks_cluster.cluster_obligatorio.name
  node_group_name = "node_group_${var.ENV}"
  node_role_arn = aws_iam_role.eksWorkerRole.arn
  subnet_ids = [
    aws_subnet.subnet_a_obligatorio.id,
    aws_subnet.subnet_b_obligatorio.id]
  ami_type = var.ami_type
  capacity_type = SPOT
  instance_types = var.instance_type
  disk_size = var.disk_size
  scaling_config {
    desired_size = var.node_desired_size
    max_size = var.node_max_size
    min_size = var.node_min_size
  }
  tags = {
    Name = "${var.ENV} EKS Node Group"
  }
}

output "endpoint_out" {
  value = aws_eks_cluster.cluster_obligatorio.endpoint
}
output "kubeconfig-certificate-authority-data_out" {
  value = aws_eks_cluster.cluster_obligatorio.certificate_authority[0].data // data del kubeconf
}
output "eks_cluster_name" {
  value = aws_eks_cluster.cluster_obligatorio.name
}
