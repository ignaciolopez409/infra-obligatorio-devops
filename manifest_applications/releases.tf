resource "helm_release" "releases" {
  for_each = {
    orders = var.orders_service_version
    payments = var.payments_service_version
    shipping = var.shipping_service_version
    products = var.products_service_version
  }
  name = "${each.key}-service"
  chart = "./microservice"
  values = [
    file("./values/${each.key}.yaml")]
}