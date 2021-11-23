resource "helm_release" "example" {
  name = "my-local-chart"
  chart = "./charts/example"
}
resource "helm_release" "example" {
  name = "my-local-chart"
  chart = "./charts/example"
}
resource "helm_release" "example" {
  name = "my-local-chart"
  chart = "./charts/example"
}
resource "helm_release" "example" {
  name = "my-local-chart"
  chart = "../modules/application-chart"
  values = [templatefile("", )]
}