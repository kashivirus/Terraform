terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-stacksimpilify"
    key= "state-commands/terraform.tfstate"
    region = "ap-south-1"    




    # For state locking 
    # dynamodb_table = "terraform-dev-state-table"
    dynamodb_table = "terraform-dev-state-table"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

 