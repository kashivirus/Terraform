







resource "aws_iam_user" "my-user" {

    for_each = toset(["Tjack" , "Tjames" , "Tdev" , "Tprod"])


    name =  each.value
  
}