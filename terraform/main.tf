provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "my-vpc"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  az                   = "us-west-2a"
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = "my-eks-cluster"
  project_name = "my-project"
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = "my-eks-cluster"
  cluster_version   = "1.24"
  cluster_role_arn  = module.iam.eks_cluster_role_arn
  node_role_arn     = module.iam.eks_node_role_arn
  subnet_ids        = [module.vpc.private_subnet_id, module.vpc.public_subnet_id]
  desired_size      = 2
  max_size          = 2
  min_size          = 2
  instance_type     = "t3a.small"
  disk_size         = 20
}

module "codebuild" {
  source             = "./modules/codebuild"
  project_name       = "my-ci-cd-project"
  description        = "CI/CD project for my application"
  codebuild_role_arn = module.iam.codebuild_role_arn
  github_repo_url    = "https://github.com/your-org/your-repo"
  buildspec          = "buildspec.yml"
}

module "ec2_argo" {
  source         = "./modules/ec2-argo"
  ami            = "ami-0abcdef1234567890"  # Replace with a valid AMI (e.g., Amazon Linux 2)
  instance_type  = "t3a.small"
  key_name       = var.key_name
  subnet_id      = module.vpc.public_subnet_id
  vpc_id         = module.vpc.vpc_id
  allowed_ip     = var.allowed_ip
  user_data      = file("../scripts/argo-grafana.sh")
}
