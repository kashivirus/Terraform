
# create s3 bucket

resource "aws_s3_bucket" "myS3bucket" {

    bucket = "${var.app_name}-${var.environment_name}-bucket"

    acl  ="public"

    tags ={
        Name = "value"
        Environment = var.environment_name
    } 
}