# CodeCommit Repository
resource "aws_codecommit_repository" "codecommit_repository" {
  repository_name = "${var.codecommit_repo_name}"
  description     = "Repository for ${var.codecommit_repo_name}."
}