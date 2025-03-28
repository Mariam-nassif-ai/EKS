module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.34.0"  # Ensure you're using the latest supported version

  cluster_name    = var.cluster_name
  cluster_version = "1.28"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  enable_irsa = true  # Enable IAM Roles for Service Accounts (IRSA)

  eks_managed_node_groups = {
    eks_nodes = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
      instance_types = ["t3.medium"]
    }
  }
}
