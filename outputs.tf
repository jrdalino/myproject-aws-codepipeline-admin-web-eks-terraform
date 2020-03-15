# CodeCommit Repository
output "terraform_codecommit_repo_arn" {
  value = "${aws_codecommit_repository.codecommit_repository.arn}"
}

# ECR Repository
output "terraform_ecr_repo_arn" {
  value = "${aws_ecr_repository.ecr_repository.arn}"
}

# S3 Bucket for Artifacts
output "s3_bucket_artifacts_arn" {
  value = "${aws_s3_bucket.build_artifact_bucket.arn}"
}

# CodeBuild
output "codebuild_service_role_arn" {
  value = "${aws_iam_role.codebuild_service_role.arn}"
}

output "codebuild_project_arn" {
  value = "${aws_codebuild_project.build_project.arn}"
}

# CodePipeline
output "codepipeline_service_role_arn" {
  value = "${aws_iam_role.codepipeline_service_role.arn}"
}

output "codepipeline_pipeline_arn" {
  value = "${aws_codepipeline.codepipeline.arn}"
}