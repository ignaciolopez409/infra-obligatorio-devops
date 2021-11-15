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
  assume_role_policy = data.aws_iam_policy.AmazonEKSClusterPolicy.policy
}

resource "aws_iam_role" "eksWorkerRole" {
  name = "eksWorkerRole"
  assume_role_policy = data.aws_iam_policy.AmazonNodePolicy.policy
}


resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  role = aws_iam_role.eksWorkerRole.name
  policy_arn = [data.aws_iam_policy.AmazonEC2CR_RO.policy, data.aws_iam_policy.AmazonCNI.policy]
}