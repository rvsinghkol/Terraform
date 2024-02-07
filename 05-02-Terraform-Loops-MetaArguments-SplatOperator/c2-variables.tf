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
# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 instance Type"
  type = list(string)
  default = ["t3.micro","t2.micro"]
  
}
# AWS EC2 Instance Type - List
variable "instance_type_Map" {
  description = "EC2 instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "prod" = "t3.micro"
  }
  
}