variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

locals {
  cluster_name = "itau-eks-${random_string.suffix.result}"
}

data "aws_availability_zones" "available" {}


