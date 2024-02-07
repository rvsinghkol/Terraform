# resource ec2 instance
resource "aws_instance" "ec290" {
    ami = "ami-0d3f444bc76de0a79"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
     "Name" = "ecdemo1"
    }
    
  
}