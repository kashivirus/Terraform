


output "ec2_instance_publicip" {
    description = "ec2 instance public ip"
    value = aws_instance.my-ec2-vm.public_ip
  
}






output "ec2_instance_privateip" {
    description = "ec2 instance public ip"
    value = aws_instance.my-ec2-vm.private_ip
  
}




output "ec2_security_groups" {
    description = "Lists security groups associated with ec2 instance"
    value = aws_instance.my-ec2-vm.security_groups
  
}




output "ec2_public_dns" {
    description = "Lists security groups associated with ec2 instance"
    value = "http://${aws_instance.my-ec2-vm.public_dns}"
  
}



output "ec2_public_placement_partition_number" {
    description = "Lists security groups associated with ec2 instance"
    value = aws_instance.my-ec2-vm.placement_partition_number
  
}