# ECR Repository
resource "aws_ecr_repository" "ecr_repository" {
  name                 = "${var.ecr_repo_name}"
  image_tag_mutability = "MUTABLE"  
}