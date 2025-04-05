terraform {
  backend "s3" {
    bucket = "b59-tf-state-bucket"
    key    = "expense-tools/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {}