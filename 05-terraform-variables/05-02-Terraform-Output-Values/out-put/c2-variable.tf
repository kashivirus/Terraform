# input variable


variable "aws_region" {
    description = "Region   in which  aws Reouces to be create"
    type = string
    default = "us-east-1"
  
}





variable "ec2_ami_id" {

    description = "AMI ID"
    type = string
    default = "ami-0f8ca728008ff5af4"
  
} 


variable "ec2_instance_type" {

    description = "EC2 Instance Type"
    type = string
    default = "t2.micro"
  
}