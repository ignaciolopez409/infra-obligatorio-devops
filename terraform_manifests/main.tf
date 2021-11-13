
locals {
  DEFAULT_TAGS = {
    ENV = var.ENV
  }
}

###test
resource "aws_ecs_cluster" "CLUSTER" {
  name = var.ENV
  tags = merge(local.DEFAULT_TAGS, {
    Name = "Cluster"
  })
}
