



# VPC
resource "aws_vpc" "vpc-dev" {
    cidr_block = "10.0.0.0/16"


    tags = {
        Name = "main"
    }
  
}



# Subnets


resource "aws_subnet" "vpc-dev-public-subnet-1" {

    vpc_id = aws_vpc.vpc-dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
}

# resource 3 Internet gateway

resource "aws_internet_gateway" "vpc-dev-igw" {
    vpc_id = aws_vpc.vpc-dev.id
}




# resource 4 Create Route Table


resource "aws_route_table" "vpc-dev-public-route-Table" {
    vpc_id = aws_vpc.vpc-dev.id
}
  
 


 # resource 5 Create Route Table  for route table   for internet acces

 resource "aws_route" "vpc-dev-public-route" {
    route_table_id = aws_route_table.vpc-dev-public-route-Table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-dev-igw.id

   
 }


#  reource # 6  Associate the Route table with the  subnet 

resource "aws_route_table_association" "vpc-dev-public-route-table-assocation" {

  route_table_id = aws_route_table.vpc-dev-public-route-Table.id
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id

}



# Security groip



resource "aws_security_group" "allow-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Default Secuity Group"
   vpc_id = aws_vpc.vpc-dev.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }



  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  egress {

    description      = "Allow All Ip and ports Outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}