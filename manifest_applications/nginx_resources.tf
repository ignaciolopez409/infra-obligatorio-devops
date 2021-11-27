resource "helm_release" "release-ingress" {
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  name = "ingress-nginx"
  create_namespace = true
  namespace = "ingress-nginx"
}