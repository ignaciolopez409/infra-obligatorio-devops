data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = var.arn_cluster_policy
}

resource "aws_iam_role" "eksClusterRole" {
  name = "eksClusterRole"
  assume_role_policy = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
}

resource "aws_iam_role" "eksWorkerRole" {
  name = "eksWorkerRole"
  assume_role_policy = var.arn_worker_policy_list[0]
}

resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  role       = aws_iam_role.eksWorkerRole.name
  count      = length(var.arn_worker_policy_list)
  policy_arn = var.arn_worker_policy_list[count.index]
}