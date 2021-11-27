resource "helm_release" "release-ingress" {
  chart = "https://kubernetes.github.io/ingress-nginx"
  name = "ingress-nginx"
  create_namespace = true
}