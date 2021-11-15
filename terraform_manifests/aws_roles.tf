data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = var.arn_cluster_policy
}

data "aws_iam_policy" "AmazonNodePolicy" {
  arn = var.arn_worker_node_policy
}

data "aws_iam_policy" "AmazonEC2CR_RO" {
  arn = var.arn_ec2_cr_ro
}

data "aws_iam_policy" "AmazonCNI" {
  arn = var.arn_cni_policy
}

resource "aws_iam_role" "eksClusterRole" {
  name = "eksClusterRole"
  assume_role_policy = jsonencode(data.aws_iam_policy.AmazonEKSClusterPolicy.id)
}

resource "aws_iam_role" "eksWorkerRole" {
  name = "eksWorkerRole"
  assume_role_policy = jsonencode(data.aws_iam_policy.AmazonNodePolicy.id)
}

//resource "aws_iam_role_policy_attachment" "Cluster_Policy" {
//  policy_arn = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
//  role = aws_iam_role.eksClusterRole.id
//}

//resource "aws_iam_role_policy_attachment" "Node_Policy" {
//  policy_arn = data.aws_iam_policy.AmazonNodePolicy.arn
//  role = aws_iam_role.eksWorkerRole.id
//}

resource "aws_iam_role_policy_attachment" "EC2_Policy" {
  policy_arn = data.aws_iam_policy.AmazonEC2CR_RO.arn
  role = aws_iam_role.eksWorkerRole.id
}

resource "aws_iam_role_policy_attachment" "CNI_Policy" {
  policy_arn = data.aws_iam_policy.AmazonCNI.arn
  role = aws_iam_role.eksWorkerRole.id
}