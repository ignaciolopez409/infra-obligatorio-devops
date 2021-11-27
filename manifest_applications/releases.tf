resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.ENV
  }
}

resource "helm_release" "releases" {
  namespace = kubernetes_namespace.ns.metadata.0.name
  for_each = toset([
    "orders",
    "payments",
    "shipping",
    "products",
  ])
  name = "${each.key}-service"
  chart = "./microservice"
  values = [
    file("./values/${each.key}.yaml")]
}