# input variable


variable "aws_region" {
    description = "Region   in which  aws Reouces to be create"
    type = string
    default = "us-east-1"
  
}

variable "db_username" {
    description = "AWS RDS dara base"
    type = string
    sensitive = true
  
}




variable "db_password" {
    description = "AWS RDS dara base"
    type = string
    sensitive = true
}