resource "helm_release" "release-ingress" {
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  name = "ingress-nginx"
  create_namespace = true
  namespace = "ingress-nginx"
}

resource "kubernetes_config_map" "nginx_configmap" {
  depends_on = [helm_release.release-ingress]
  metadata {
    name = "nginx-configmap"
    namespace = "ingress-nginx"
  }
  data = {
    proxy-protocol: "True"
    real-ip-header: "proxy_protocol"
    set-real-ip-from: "0.0.0.0/0"
  }
}

