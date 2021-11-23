resource "kubernetes_namespace" "obligatorio" {
  metadata {
    name = "${var.ENV}"
  }
}