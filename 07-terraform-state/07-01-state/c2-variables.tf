


# input variabiles

variable "aws_region" {
  description = "regio in which aws resorce to be created"
  type = string
  default = "ap-south-1"
}




 


# Assign when prompted using CLI

variable "instance_type" {
  description = "Ec2 instance type"
  type = string
  default = "t2.micro"
}