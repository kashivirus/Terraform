
resource "aws_instance" "my-ec2-vm" {
    ami  = var.ec2_ami_id
    instance_type= "t2.micro"

    key_name = "kashif_terraform"

    count = var.ec2-instance-count

    user_data = <<-EOF
    #!/bin/bash
    sudo mkdir VVVda5
    sudo mkdir VVVadsss4
    sudo mkdir VVVasd33
    sudo mkdir VVVasd2
    sudo mkdir VVVvc342


    EOF


    vpc_security_group_ids = [aws_security_group.vpc-ssh.id  , aws_security_group.vpc-web ]

    tags = {
      "key" = "demo"
    }
  
}