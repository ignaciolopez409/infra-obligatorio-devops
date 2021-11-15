// Variables
variable "ENV" {
  default = "develop"
  type = string
}

variable "orders_service_version" {
  type = string
}
variable "products_service_version" {
  type = string
}
variable "shipping_service_version" {
  type = string
}
variable "payments_service_version" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_a_cidr" {
  type = string
}

variable "subnet_b_cidr" {
  type = string
}

variable "subnet_c_cidr" {
  type = string
}

variable "arn_cluster_policy" {
  type = string
}

variable "arn_worker_policy_list" {
  type = list(string)
}

variable "node_desired_size" {
  type = number
}

variable "node_max_size" {
  type = number
}

variable "node_min_size" {
  type = number
}

variable "ami_type" {
  type = string
  default = "AL2_x86_64"
}

variable "instance_type" {
  type = list(string)
  default = ["t3.micro"]
}

variable "disk_size" {
  type = number
  default = 20
}