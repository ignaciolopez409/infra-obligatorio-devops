locals {
  env = split("-", terraform.workspace)[1]
  dns = local.env == "prd" ? "tupana.com.do" : "mipana.com"
}

resource "kubectl_manifest" "eks_master_ingress" {
  yaml_body = <<YAML
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ms-master-ingress
  namespace: tp-ns-ec2
  annotations:
    #kubernetes.io/ingress.class: "nginx"
    nginx.org/listen-ports: "8090"
    nginx.org/listen-ports-ssl: "8443"
    nginx.org/mergeable-ingress-type: "master"
spec:
  ingressClassName: nginx # use only with k8s version >= 1.18.0
  rules:
  - host: "*.${local.dns}"
YAML
}

/*
resource "kubectl_manifest" "eks_custom_ingress" {
    yaml_body = <<YAML
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: back-ms-customentries
  namespace: tp-ns-ec2
  annotations:
    #kubernetes.io/ingress.class: "nginx"
    nginx.org/listen-ports: "8090"
    nginx.org/listen-ports-ssl: "8443"
    nginx.org/mergeable-ingress-type: "minion"
spec:
  ingressClassName: nginx # use only with k8s version >= 1.18.0
  rules:
  - host: "*.${local.dns}"
    http:
      paths:
      - path: /commerce/v1/commerces/all
        backend:
          serviceName: back-ms-wiremock
          servicePort: 80
      - path: /virtual-account
        backend:
          serviceName: back-ms-virtual-account
          servicePort: 80
      - path: /virtual-account/verify-client
        backend:
          serviceName: back-ms-wiremock
          servicePort: 80
      - path: /virtual-account/cash-in
        backend:
          serviceName: back-ms-wiremock
          servicePort: 80
YAML
}
*/
