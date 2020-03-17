# General
variable "aws_region" {
  type        = "string"
  description = "Used AWS Region."    
}

variable "aws_account" {
  type        = "string"
  description = "Used AWS Account."    
}

# CodeCommit Repository
variable "codecommit_repo_name" {
  type        = "string"
  description = "CodeCommit Repository name."
}

# ECR Repository
variable "ecr_repo_name" {
  type        = "string"
  description = "ECR Repository name."    
}

# S3 Bucket for Artifacts
variable "s3_bucket_artifacts_name" {
  type        = "string"
  description = "S3 Bucket for Artifacts name."    
}

# CodeBuild Role
variable "codebuild_service_role_name" {
  type        = "string"
  description = "CodeBuild Service Role name."  
}

variable "codebuild_service_role_policy_name" {
  type        = "string"
  description = "CodeBuild Service Role Policy name."    
}

variable "codebuild_project_name" {
  type        = "string"
  description = "Codebuild Project name."    
}

# CodePipeline Pipeline
variable "codepipeline_service_role_name" {
  type        = "string"
  description = "CodePipeline Service Role name."    
}

variable "codepipeline_service_role_policy_name" {
  type        = "string"
  description = "CodePipeline Service Role Policy name."    
}

variable "codepipeline_pipeline_name" {
  type        = "string"
  description = "Codepipeline pipeline name."    
}

# Lambda
variable "lambda_function_name" {
  type        = "string"
  description = "Lambda Function name."    
}