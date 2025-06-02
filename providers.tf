# Copied from https://github.com/KLee-2524/learning-terraform-3087701
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
