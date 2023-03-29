


provider "aws" {
    region = "ap-south-1"


resource "aws_vpc" "my_vpc"{
    cidr_block = "10.0.0.0/16"
    tags ={
        Name = "MY_VPC"
    }
}

}

resource "aws_subnet" "my_app_subnet" {
    tags ={
        Name ="App_Subnet"
    }

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch =true
    depends_on  = [aws_vpc_.my_vpc]
  
}





resource "aws_route_table" "my_route_table"{
    tags ={
        Name = "My_Route_table"
    }

    vpc_id = aws_vpc.my_vpc.id
}




resource "aws_route_table_association" "App_Route_Association"{
    subnet_id =aws_subnet.my_app_subnet.id
    route_table_id = aws_route_table.my_route_table.id
}


resource "aws_internet_gateway" "my_IG"{
    tags = {
        Name = "MY_IGW"
    }

    vpc_id = aws_vpc.my_vpc.id
    depends_on = [aws_vpc.my_vpc]
}



resource "aws_route" "default_route"{
    route_table_id =aws_route_table.my_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_IG.id
}


resource "aws_security_group" "App_SG" {
  name        = "App_SG"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "tcp"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }



  ingress {
    description      = "tcp"
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }


  egress {
    protocol        = "-1"
    to_port          = 0
    from_port        = 0
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_custom"
  }
}




resource "tls_private_key" "Web-Key"{
    algorithm = "RSA"
}



resource "aws_key_pair" "App-instnace-Key"{
    key_name = "Web-Key"
    public_key = tls_private_key.Web-Key.public_key_openssh
}



resource "local_file" "Web-Key" {
    content = tls_private_key.Web-Key.private_key_pem
    filename = "Web-Key.pem"
  
}
