output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "ec2_argo_public_ip" {
  value = module.ec2_argo.public_ip
}
