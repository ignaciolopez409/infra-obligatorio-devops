data "aws_region" "current" {}

provider "kubernetes" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "ns_ec2" {
  metadata {
    name = "tp-ns-ec2"

    labels = {
      mesh = "appmesh-tupana-${local.env}"
      "appmesh.k8s.aws/sidecarInjectorWebhook" = "enabled"
    }
  }
  
}

resource "kubernetes_namespace" "ns_fargate" {
  metadata {
    name = "tp-ns-fargate"
  }
}

resource "kubernetes_namespace" "ns_cloudwatch" {
  metadata {
    name = "amazon-cloudwatch"
  }
}

resource "kubernetes_namespace" "ns_monitoring" {
  metadata {
    name = "monitoring"
  }
}

module "base_serviceaccount" {
  source                = "../modules/SERVICEACCOUNTS"
  eks_oidc_provider_url = data.terraform_remote_state.vpc.outputs.eks_oidc_provider_url
  eks_oidc_provider_arn = data.terraform_remote_state.vpc.outputs.eks_oidc_provider_arn
  namespace             = "tp-ns-ec2"
  serviceaccount_name   = "sa-k8-base"
  depends_on            = [data.terraform_remote_state.vpc, kubernetes_namespace.ns_ec2, kubernetes_namespace.ns_fargate]
}

resource "helm_release" "aws_load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  chart      = "../Charts/aws-load-balancer-controller"
  namespace  = "tp-ns-ec2"

  set {
    name  = "clusterName"
    value = data.terraform_remote_state.vpc.outputs.cluster_name
  }
  set {
    name  = "serviceAccount.create"
    value = "false"
  }
  set {
    name  = "serviceAccount.name"
    value = module.base_serviceaccount.serviceaccount_name
  }

  set {
    name  = "region"
    value = data.aws_region.current.name
  }

  set {
    name  = "vpcId"
    value = data.terraform_remote_state.vpc.outputs.vpc_id
  }

  depends_on = [data.terraform_remote_state.vpc, kubernetes_namespace.ns_ec2, kubernetes_namespace.ns_fargate]
}
