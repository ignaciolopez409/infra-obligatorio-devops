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
  name = "eksClusterRole-${var.ENV}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role" "eksWorkerRole" {
  name = "eksWorkerRole-${var.ENV}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "Cluster_Policy" {
  policy_arn = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
  role = aws_iam_role.eksClusterRole.name
}

resource "aws_iam_role_policy_attachment" "Node_Policy" {
  policy_arn = data.aws_iam_policy.AmazonNodePolicy.arn
  role = aws_iam_role.eksWorkerRole.name
}

resource "aws_iam_role_policy_attachment" "EC2_Policy" {
  policy_arn = data.aws_iam_policy.AmazonEC2CR_RO.arn
  role = aws_iam_role.eksWorkerRole.name
}

resource "aws_iam_role_policy_attachment" "CNI_Policy" {
  policy_arn = data.aws_iam_policy.AmazonCNI.arn
  role = aws_iam_role.eksWorkerRole.name
}