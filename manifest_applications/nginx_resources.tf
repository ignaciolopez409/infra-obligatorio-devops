resource "kubernetes_namespace" "ingress-ns" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "kubernetes_config_map" "nginx_configmap" {
  metadata {
    name = "nginx-configmap"
    namespace = kubernetes_namespace.ingress-ns.metadata.0.name
  }
  data = {
    proxy-protocol: "True"
    real-ip-header: "proxy_protocol"
    set-real-ip-from: "0.0.0.0/0"
  }
}

resource "helm_release" "release-ingress" {
  depends_on = [kubernetes_config_map.nginx_configmap]
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  name = "ingress-nginx"
  namespace = kubernetes_namespace.ingress-ns.metadata.0.name
}