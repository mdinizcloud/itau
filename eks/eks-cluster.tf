module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"
  #version = "20.14.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.30"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.public_subnets
  control_plane_subnet_ids       = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  cluster_service_ipv4_cidr      = "172.20.0.0/16" 

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = ["t3.small"]
      min_size       = 3
      max_size       = 7
      desired_size   = 5
    }

    two = {
      name           = "node-group-2"
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 5
      desired_size   = 3
    }
  }
}