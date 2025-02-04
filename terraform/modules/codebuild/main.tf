resource "aws_codebuild_project" "this" {
  name          = var.project_name
  description   = var.description
  service_role  = var.codebuild_role_arn
  build_timeout = 30

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  source {
    type      = "GITHUB"
    location  = var.github_repo_url
    buildspec = var.buildspec
  }
}
