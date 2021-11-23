// Variables
variable "ENV" {
  default = "develop"
  type = string
}
variable "region" {
  type = string
  default = "us-east-1"
}
variable "orders_service_version" {
  type = string
}
variable "products_service_version" {
  type = string
}
variable "shipping_service_version" {
  type = string
}
variable "payments_service_version" {
  type = string
}