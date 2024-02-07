# aws region
variable "aws_region" {
 description = "Region in which AWS Resources to be created" 
 type = string
 default = "ap-south-1"
}

# aws instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

# aws key pair
variable "instance_keypair" {
    description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
    type = string
    default = "terraform-key"
 
}