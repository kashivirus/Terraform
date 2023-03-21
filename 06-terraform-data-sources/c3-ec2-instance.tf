
resource "aws_instance" "my-ec2-vm" {
    ami  = data.aws_ami.linux.id
    instance_type= "t2.micro"

    key_name = "kashif-terraform"

    count = 3
    # count = var.ec2-instance-count

    user_data = file("/home/kashi/Documents/Cloud-Lem/Terraform/06-terraform-data-sources/isntall.sh")
 


    vpc_security_group_ids = [aws_security_group.vpc-ssh.id  , aws_security_group.vpc-web.id ]

    tags = {
      "key" = "demo"
    }
  
}