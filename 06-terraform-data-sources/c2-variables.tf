


# input variabiles

variable "aws_region" {
  description = "regio in which aws resorce to be created"
  type = string
  default = "ap-south-1"
}






variable "ec2_ami_id" {
    description = "AMi id"
    type = string
    default =  "ami-0f8ca728008ff5af4"
 
}


# variable "ec2-instance-count" {
#     description = "Ec2 instance count"
#     type = number
#     default = 1
  
# }


# Assign when prompted using CLI

variable "ec2_instance_type" {
  description = "Ec2 instance type"
  type = string
  default = "t2.micro"
}