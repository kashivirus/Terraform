



resource "aws_instance" "my-ec2-vm" {

    ami = var.ec
    instance_type = var.ec2_instance_type
    key_name= "kashif-terraform"

    user_data = file("/home/kashi/Documents/Cloud-Lem/Terraform/05-terraform-variables/05-02-Terraform-Output-Values/v10-sensitive-input-variables/scr.sh")

    vpc_security_group_ids = [aws_security_group.vpc.vpc-ssh , aws_security_group.vpc.vpc-web]


    tags = {
        "Name" = "Web"
    }
  
}