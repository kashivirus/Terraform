


data "aws_ami" "linux" {
    most_recent = true
    owners = ["amazon"]


    filter {
      name ="name"
      values = ["amzn2-ami-hvm-*"]
    }


    filter {
      name  = "root-device-type"
      values = ["ebs"]
    }



    # filter {
    #   name = ["virtualization"]  
    #   values = ["hvm"]
    # }



    filter {
      name = "architecture"
      values = ["x86_64"]
    }







}