resource "helm_release" "releases" {
  for_each = [
    "orders",
    "payments",
    "shipping",
    "products",
  ]
  name = "${each.key}-service"
  chart = "./microservice"
  values = [
    file("./values/${each.key}.yaml")]
}