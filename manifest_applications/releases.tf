resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.ENV
  }
}

resource "helm_release" "helm_os" {
  namespace = kubernetes_namespace.ns.metadata.0.name
  name = "orders-service"
  chart = "./microservice"
  values = [
    file("../environments/${var.ENV}/values/orders.yaml")]
}

resource "helm_release" "helm_pys" {
  namespace = kubernetes_namespace.ns.metadata.0.name
  name = "payments-service"
  chart = "./microservice"
  values = [
    file("../environments/${var.ENV}/values/payments.yaml")]
}

resource "helm_release" "helm_prs" {
  namespace = kubernetes_namespace.ns.metadata.0.name
  name = "products-service"
  chart = "./microservice"
  values = [
    file("../environments/${var.ENV}/values/products.yaml")]
}

resource "helm_release" "helm_ss" {
  namespace = kubernetes_namespace.ns.metadata.0.name
  name = "shipping-service"
  chart = "./microservice"
  values = [
    file("../environments/${var.ENV}/values/shipping.yaml")]
}

resource "kubernetes_ingress" "obligatorio_ingress" {
  metadata {
    name = "${var.ENV}-ingress"
    namespace = kubernetes_namespace.ns.metadata.0.name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.org/rewrites" = "serviceName=ingress-nginx-controller.ingress-nginx.svc.cluster.local rewrite=/"
    }
  }
  spec {
    rule {
      host = "${var.ENV}-obligatorio.devops.com" // develop-obligatorio.devops.com
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

