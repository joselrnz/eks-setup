variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster (used for naming roles)"
}

variable "project_name" {
  type        = string
  description = "Project name used for naming the CodeBuild role"
}
