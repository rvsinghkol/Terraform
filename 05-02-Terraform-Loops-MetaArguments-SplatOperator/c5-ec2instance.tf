# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# Ec2 create

resource "aws_instance" "ec2vm" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.instance_type
    # instance_type = var.instance_type_list[1]
    instance_type = var.instance_type_Map["dev"]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id,aws_security_group.web-app.id ]
    for_each = toset(data.aws_availability_zones.my_azones.names)
    availability_zone = each.key
    tags = {
      "Name" = "for_each-demo-${each.value}"
    }
    
 }
