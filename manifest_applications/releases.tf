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

resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
    annotations = {
      "ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/orders"
          backend {
            service_name = "orders-service"
            service_port = "8080"
          }
        }
        path {
          path = "/payments"
          backend {
            service_name = "payments-service"
            service_port = "8080"
          }
        }
        path {
          path = "/shipping"
          backend {
            service_name = "shipping-service"
            service_port = "8080"
          }
        }
        path {
          path = "/products"
          backend {
            service_name = "products-service"
            service_port = "8080"
          }
        }
      }
    }
  }
}

