// Secrets
resource "kubernetes_secret" "gitlabregistry" {
  depends_on = [
    rancher2_namespace.geopos-express-namespace]
  metadata {
    name = "gitlabregistry"
    namespace = rancher2_namespace.geopos-express-namespace.name
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
{
  "auths": {
    "${var.registry.server}": {
      "auth": "${local.encode}"
    }
  }
}
DOCKER
  }
  type = "kubernetes.io/dockerconfigjson"
}
resource "kubernetes_secret" "MONGO_URI" {
  metadata {
    namespace = rancher2_namespace.geopos-express-namespace.name
    generate_name = "secret-"
  }
  data = {
    MONGO_URI_RAW = "nMK+iTo7hpYy8EA4CKHgKrY0rXGCwDBIolsk3vne+pgZwI/9A7P1Hgr0mCBgZu5nSOD8VU1QnqoGqGXmV4ILmgWuqP4kC1o+iEH3COh4Zefy/1xmcOBCa+OVKFC4JxvAO6jPpdydhqavjJ9GVo/QKjTWiIAEwxi5"
    MONGO_URI = "mongodb://nMK+iTo7hpYy8EA4CKHgKrY0rXGCwDBIolsk3vne+pgZwI/9A7P1Hgr0mCBgZu5nSOD8VU1QnqoGqGXmV4ILmgWuqP4kC1o+iEH3COh4Zefy/1xmcOBCa+OVKFC4JxvAO6jPpdydhqavjJ9GVo/QKjTWiIAEwxi5"

  }
}
resource "kubernetes_secret" "MONGO_URI_MYADMIN" {
  metadata {
    namespace = rancher2_namespace.geopos-express-namespace.name
    generate_name = "secret-"
  }
  data = {
    MONGO_URI = "mongodb://myUserAdmin:abc123@192.168.240.165:27020,192.168.240.166:27020/?authSource=admin"
  }
}
resource "kubernetes_secret" "MONGO_URI_PEYA" {
  metadata {
    namespace = rancher2_namespace.geopos-express-namespace.name
    generate_name = "secret-"
  }
  data = {
    MONGO_URI = "mongodb://myUserAdmin:abc123@192.168.240.165:27020,192.168.240.166:27020/geopos3-peya?authSource=admin"
  }
}
resource "kubernetes_secret" "MONGO_URI_MELI" {
  metadata {
    namespace = rancher2_namespace.geopos-express-namespace.name
    generate_name = "secret-"
  }
  data = {
    MONGO_URI = "mongodb://myUserAdmin:abc123@192.168.240.165:27020,192.168.240.166:27020/geopos3-meli?ssl=false&authSource=admin"
  }
}