

# Auto-generated Docs

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.route_table_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_eks_cluster.cluster_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.node_group_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eksClusterRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eksWorkerRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.Cluster_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.EC2_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.Node_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table_association.subnet_a_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet_b_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet_c_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.kubernetes_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.subnet_a_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_b_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_c_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc_obligatorio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy.AmazonCNI](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.AmazonEC2CR_RO](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.AmazonNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ENV"></a> [ENV](#input\_ENV) | Variables | `string` | `"develop"` | no |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | n/a | `string` | `"AL2_x86_64"` | no |
| <a name="input_arn_cluster_policy"></a> [arn\_cluster\_policy](#input\_arn\_cluster\_policy) | n/a | `string` | n/a | yes |
| <a name="input_arn_cni_policy"></a> [arn\_cni\_policy](#input\_arn\_cni\_policy) | n/a | `string` | n/a | yes |
| <a name="input_arn_ec2_cr_ro"></a> [arn\_ec2\_cr\_ro](#input\_arn\_ec2\_cr\_ro) | n/a | `string` | n/a | yes |
| <a name="input_arn_worker_node_policy"></a> [arn\_worker\_node\_policy](#input\_arn\_worker\_node\_policy) | n/a | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `20` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `list(string)` | <pre>[<br>  "t3.micro"<br>]</pre> | no |
| <a name="input_node_desired_size"></a> [node\_desired\_size](#input\_node\_desired\_size) | n/a | `number` | n/a | yes |
| <a name="input_node_max_size"></a> [node\_max\_size](#input\_node\_max\_size) | n/a | `number` | n/a | yes |
| <a name="input_node_min_size"></a> [node\_min\_size](#input\_node\_min\_size) | n/a | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_subnet_a_cidr"></a> [subnet\_a\_cidr](#input\_subnet\_a\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_subnet_b_cidr"></a> [subnet\_b\_cidr](#input\_subnet\_b\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_subnet_c_cidr"></a> [subnet\_c\_cidr](#input\_subnet\_c\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | n/a |
| <a name="output_endpoint_out"></a> [endpoint\_out](#output\_endpoint\_out) | n/a |
| <a name="output_kubeconfig-certificate-authority-data_out"></a> [kubeconfig-certificate-authority-data\_out](#output\_kubeconfig-certificate-authority-data\_out) | n/a |
