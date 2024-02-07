# Ec2 create
resource "aws_instance" "ec2vm" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id,aws_security_group.web-app.id ]
  # Create EC2 Instance in all Availabilty Zones of a VPC  
  #for_each = toset(data.aws_availability_zones.my_azones.names)
  for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
        az => details.instance_types if length(details.instance_types) !=0 }))

    availability_zone = each.key
    tags = {
      "Name" = "EC2demo-${each.key}"  
    }
  
}
