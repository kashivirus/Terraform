terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"

}




# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main internet gw"
  }
}


#######################################################1
resource "aws_subnet" "first_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "first_subnet"
  }
}

###################################################2

resource "aws_subnet" "second_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.128.0/24"

  tags = {
    Name = "second_subnet"
  }
}








resource "aws_route_table" "rt" {
    vpc_id     = aws_vpc.main.id

    route = []
  tags = {
    Name = "route table "
  }
}




# Route

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

  depends_on = [aws_route_table.rt]
}






# secuirty group 


resource "aws_security_group" "sg" {
  name        = "allow_traffic"
  description = "Allow all inbound traffic"
  vpc_id     = aws_vpc.main.id

  ingress {
    description      = "All traffic"
    from_port        = 0    #all ports
    to_port          = 0    #all ports
    protocol         = "-1" # all traffice
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_traffice"
  }
}






resource "aws_route_table_association" "one" {
  subnet_id      = aws_subnet.first_subnet.id
  route_table_id = aws_route_table.rt.id
}



resource "aws_route_table_association" "two" {
  subnet_id      = aws_subnet.second_subnet.id
  route_table_id = aws_route_table.rt.id
}



resource "aws_instance" "one" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.first_subnet.id
  key_name = "kashif-terraform"
  tags = {
    Name = "one"
  }

}



resource "aws_instance" "two" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.second_subnet.id
    key_name = "kashif-terraform"
  tags = {
    Name = "two"
  }

}