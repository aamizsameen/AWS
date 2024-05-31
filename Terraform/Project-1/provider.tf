# Terraform Settings Block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Provider Block

provider "aws" {
  region  = "ap-south-1"
}