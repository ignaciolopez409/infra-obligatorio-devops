resource "helm_release" "releases" {
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