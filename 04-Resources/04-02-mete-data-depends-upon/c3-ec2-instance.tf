


resource "aws_instance" "my-ec2-vm" {
    ami  = "ami-0f8ca728008ff5af4"
    instance_type= "t2.micro"

    key_name = "kashif-terraform"


    subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
    # "aws_subnet" "vpc-dev-public-subnet-1"

    # security_groups = ["aws_security_group.allow-vpc-sg.id"]

    vpc_security_group_ids =  [aws_security_group.allow-vpc-sg.id]
    # user_data = "mkdir kkkkkkkkkk"


    user_data = <<-EOF
    #! /bin/bash
    mkdir KKKKK

    EOF

    tags = {
      "Name" = "demo"
    }

}