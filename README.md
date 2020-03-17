# Terraform module to provision a CI/CD Pipeline using AWS Managed Services (React Web Application)

## This creates the following resources:
- CodeCommit
- ECR
- S3 Bucket for Artifacts
- Service Role for CodeBuild
- CodeBuild Project
- Service Role for CodePipeline
- CodePipeline Pipeline

## CI/CD Pipline Usage
1. Developers commit code to an AWS CodeCommit repository and create pull requests to review proposed changes to the production code. When the pull request is merged into the master branch in the AWS CodeCommit repository, AWS CodePipeline automatically detects the changes to the branch and starts processing the code changes through the pipeline.
2. AWS CodeBuild packages the code changes as well as any dependencies and builds a Docker image. Optionally, another pipeline stage tests the code and the package, also using AWS CodeBuild.
3. The Docker image is pushed to Amazon ECR after a successful build and/or test stage.
4. AWS CodePipeline invokes an AWS Lambda function that includes the Kubernetes Python client as part of the function’s resources. The Lambda function performs a string replacement on the tag used for the Docker image in the Kubernetes deployment file to match the Docker image tag applied in the build, one that matches the image in Amazon ECR.
5. After the deployment manifest update is completed, AWS Lambda invokes the Kubernetes API to update the image in the Kubernetes application deployment.
6. Kubernetes performs a rolling update of the pods in the application deployment to match the docker image specified in Amazon ECR. The pipeline is now live and responds to changes to the master branch of the CodeCommit repository.

## Prerequisites
- Provision an S3 bucket to store Terraform State and DynamoDB for state-lock
using https://github.com/jrdalino/aws-tfstate-backend-terraform
- Lambda Function to deploy to EKS https://github.com/jrdalino/aws-lambda-deploy-ecr-to-eks-nodejs-terraform

## Usage
- Replace variables in terraform.tfvars
- Replace variables in state_config.tf
- Initialize, Review Plan and Apply
```
$ terraform init
$ terraform plan
$ terraform apply
```
- Note: New repositories are **not** created with their default branch. Once the module has ran you must clone the repository, add files, commit changes locally and then push to initialize the repository.

## Deploy
- Clone empty CodeCommit repository and copy code from https://github.com/jrdalino/myproject-webapp-service-react Note: Make sure CodeCommit Git credentials have been configured. 

## (Optional) Cleanup
```
$ terraform destroy
```

## Inputs
| Name | Description |
|------|-------------|

## Outputs
| Name | Description |
|------|-------------|

## (In Progress) Module Usage

## References
- https://medium.com/@BranLiang/step-by-step-to-setup-continues-deployment-kubernetes-on-aws-with-eks-code-pipeline-and-lambda-61136c84bbcd
- https://docs.aws.amazon.com/code-samples/latest/catalog/lambda_functions-codepipeline-MyCodePipelineFunction.js.html
- https://github.com/karthiksambandam/aws-eks-cicd-essentials/blob/master/Lab1.md#setup-lambda-for-deployment