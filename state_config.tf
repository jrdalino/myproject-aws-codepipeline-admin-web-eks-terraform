terraform {
  backend "s3" {
    region         = "ap-southeast-2"
    bucket         = "222337787619-ap-southeast-2-terraform-state"
    key            = "codepipeline-webapp.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-state-lock"
  }
}