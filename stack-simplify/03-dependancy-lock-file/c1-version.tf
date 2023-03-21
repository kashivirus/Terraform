# ami-0f8ca728008ff5af4




# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.21"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = "ap-south-1" 
# }



# resource "aws_instance" "ec2demo" {
#     ami  = "ami-0f8ca728008ff5af4"
#     instance_type= "t2.micro"


#     tags = {
#       "key" = "demo"
#     }

# }

# Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }


# terraform setting block

# terraform {
# #   required_version = "~> 0.14.6"


#   required_providers {

#     source     = "hashicorp/aws"
#     version = ">=2.0.0"


#     random = {
#       source  = "hashicorp/random"
#       version = "3.0.0"
#     }


#   }

# }






terraform{
    # required_version = "~< 0.14.6"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version=  ">=2.0.0"
        }

        random ={
            source = "hashicorp/random"
            version  ="3.0.0"
        }
    }
}



provider "aws" {
  region = "ap-south-1"
  profile = "default" 
}