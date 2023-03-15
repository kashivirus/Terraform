



resource "aws_instance" "my-ec2-vm" {
    ami  = "ami-0f8ca728008ff5af4"

    instance_type= "t2.micro"
    availability_zone  = "ap-south-1"
  


  tags = {
    "Name":"Web"
  }
}