# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
    for_each = toset([ "ap-south-1a","ap-south-1b","ap-south-1c" ])
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name = "location"
    values = [each.key]
  #  values = ["ap-south-1c"]
  }

  location_type = "availability-zone"
  
}

# Important Note: Once for_each is set, its attributes must be accessed on specific instances
output "output_2" {
#  value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
   value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])
}

#Output-2
# Create a Map with Key as Availability Zone and value as Instance Type supported
output "output_2_1" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2: 
        az => details.instance_types
         }
  
}
