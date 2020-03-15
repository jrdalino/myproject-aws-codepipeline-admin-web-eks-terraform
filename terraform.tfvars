# General
aws_region  = "ap-southeast-2"
aws_profile = "leon.tanner@excelian.com"
aws_account = "222337787619"

# CodeCommit Repository
codecommit_repo_name = "myproject-webapp-service"

# ECR Repository
ecr_repo_name = "myproject-webapp-service"

# S3 Bucket for Artifacts
s3_bucket_artifacts_name = "222337787619-myproject-webapp-service-codepipeline"

# CodeBuild
codebuild_service_role_name        = "myproject-webapp-service-codebuild-service-role"
codebuild_service_role_policy_name = "myproject-webapp-service-codebuild-service-role-policy"
codebuild_project_name             = "myproject-webapp-service-codebuild"

# CodePipeline
codepipeline_service_role_name        = "myproject-webapp-service-codepipeline-service-role"
codepipeline_service_role_policy_name = "myproject-webapp-service-codepipeline-service-role-policy"
codepipeline_pipeline_name            = "myproject-webapp-service-codepipeline"

# Lambda
lambda_function_name = "myproject-customer-service-lambda"