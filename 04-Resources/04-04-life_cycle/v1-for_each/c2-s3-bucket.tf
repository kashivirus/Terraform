







resource "aws_s3_bucket" "myS3bucket" {


  # for_each_MetaArguments    
  for_each = {

    dev  = "my-dapp-bucketxxx"
    qa   = "my-qapp-bucketxxx"
    stag = "my-sapp-bucketxxx"
    prod = "my-papp-bucketxxx"

  }


  bucket = "${each.key}-${each.value}"
  # acl = "private"



  tags = {

    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}