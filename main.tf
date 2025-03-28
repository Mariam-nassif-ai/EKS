
# Refer to VPC Module - Jenkins
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "my-eks-vpc"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"] # Ensure these are in different AZs
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"] # Ensure these are in different AZs
}



# Refer to EKS Module
module "eks" {
  source       = "./modules/eks"
  cluster_name = "my-eks-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids # Use dynamically created subnets
}
