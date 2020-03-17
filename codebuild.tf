# CodeBuild Role
resource "aws_iam_role" "codebuild_service_role" {
  name = "${var.codebuild_service_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codebuild_service_role_policy" {
  name = "${var.codebuild_service_role_policy_name}"
  role = "${aws_iam_role.codebuild_service_role.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "codecommit:ListBranches",
                "codecommit:ListRepositories",
                "codecommit:BatchGetRepositories",
                "codecommit:Get*",
                "codecommit:GitPull"
            ],
            "Resource": [
                "${aws_codecommit_repository.codecommit_repository.arn}"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

# CodeBuild Project
resource "aws_codebuild_project" "build_project" {
  name        = "${var.codebuild_project_name}"
  description = "The CodeBuild project for ${var.codecommit_repo_name}"

  # Source
  source {
    type     = "CODECOMMIT"
    location = "https://git-codecommit.ap-southeast-2.amazonaws.com/v1/repos/${var.codecommit_repo_name}"
  }

  # Environment
  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/python:3.5.2"
    type            = "LINUX_CONTAINER"
    privileged_mode = "true"

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = "${var.aws_account}"
    }

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "${var.aws_region}"
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${var.ecr_repo_name}" # ECR Repo
    }            
  }
  service_role  = "${aws_iam_role.codebuild_service_role.arn}"
  build_timeout = "60" # Adjust this if needed
  
  # Artifacts
  artifacts {
    type = "NO_ARTIFACTS" # Push Docker Image to ECR
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }

  # Logs
  logs_config {
    cloudwatch_logs {
      group_name = "/aws/codebuild/${var.codebuild_project_name}"
    }
  }
}