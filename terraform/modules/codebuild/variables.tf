variable "project_name" {
  type = string
}

variable "description" {
  type    = string
  default = "CodeBuild project for CI/CD"
}

variable "codebuild_role_arn" {
  type = string
}

variable "github_repo_url" {
  type = string
}

variable "buildspec" {
  type    = string
  default = "buildspec.yml"
}
