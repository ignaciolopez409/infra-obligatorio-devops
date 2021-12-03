resource "kubernetes_config_map" "nginx_configmap" {
  metadata {
    name = "nginx-configmap"
    namespace = helm_release.release-ingress.namespace
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
  create_namespace = true
  namespace = "ingress-nginx"
}